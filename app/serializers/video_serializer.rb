# frozen_string_literal: true

# poro for video serializer
class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :position
end
