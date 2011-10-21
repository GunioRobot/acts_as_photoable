module ActiveRecord
  module Acts #:nodoc:
    module Photoable #:nodoc:
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_photoaable
          has_many :photos, :as => :photoable, :dependent => :destroy

          class_eval <<-EOV
            include ActiveRecord::Acts::Photoable::InstanceMethods
          EOV
        end
      end

      module InstanceMethods
        def save_with_photos(files)
          photos = []
          files.delete_if(&:blank?).each do |file|
            photos << Photo.new(:photo => file, :photoable => self)
          end
          Photo.transaction { photos.each &:save! }
        rescue ActiveRecord::RecordInvalid => e
          return false
        end
      end
    end
  end
end