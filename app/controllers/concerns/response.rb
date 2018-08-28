module Response
  def json_response(object, status = :ok)
    return if object.nil?
    reflect_association_object = object.is_a?(ActiveRecord::Relation) ? object.first : object
    accessible = object.attribute_names - %w[created_at updated_at]
    render json: object.as_json(only: accessible.map!(&:to_sym),
                                include: reflect_associations(reflect_association_object),
                                methods: :human_created_at), status: status
  end

  def reflect_associations(object)
    return if object.nil?
    associations = object.class.reflect_on_all_associations.map(&:name)
    return unless associations
    associations
  end
end
