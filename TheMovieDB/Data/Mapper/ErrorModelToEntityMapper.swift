class ErrorModelToEntityMapper: Mapper<ErrorModel, ErrorEntity> {
    override func reverseMap(value: ErrorEntity) -> ErrorModel {
        return ErrorModel(message: value.message)
    }
}
