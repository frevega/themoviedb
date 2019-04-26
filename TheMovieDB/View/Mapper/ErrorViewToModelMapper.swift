class ErrorViewToModelMapper: Mapper<ErrorView, ErrorModel> {
    override func reverseMap(value: ErrorModel) -> ErrorView {
        return ErrorView(message: value.message)
    }
}
