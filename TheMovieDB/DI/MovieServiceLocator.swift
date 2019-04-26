class MovieServiceLocator {
    private let codableHelper = CodableHelper()
    
    private var movieRestApi: MovieRestApi {
        return MovieRestApiImpl(codableHelper: codableHelper)
    }
    
    private var movieDataSource: MovieDataSource {
        return MovieDataSourceImpl(restApi: movieRestApi)
    }
    
    private var movieModelToEntityMapper: Mapper<MovieModel, MovieEntity> {
        return MovieModelToEntityMapper()
    }
    
    private var movieResponseModelToEntityMapper: Mapper<MovieResponseModel, MovieResponseEntity> {
        return MovieResponseModelToEntityMapper(movieModelToEntityMapper: movieModelToEntityMapper)
    }
    
    private var errorModelToEntityMapper: Mapper<ErrorModel, ErrorEntity> {
        return ErrorModelToEntityMapper()
    }
    
    private var movieDataRepository: MovieRepository {
        return MovieRepositoryImpl(datasource: movieDataSource,
                                   movieResponseModelToEntityMapper: movieResponseModelToEntityMapper,
                                   errorModelToEntityMapper: errorModelToEntityMapper
        )
    }
    
    var movieViewToModelMapper: MovieViewToModelMapper {
        return MovieViewToModelMapper()
    }
    
    var movieResponseViewToModelMapper: MovieResponseViewToModelMapper {
        return MovieResponseViewToModelMapper(movieViewToModelMapper: movieViewToModelMapper)
    }
    
     var errorViewToModelMapper: Mapper<ErrorView, ErrorModel> {
        return ErrorViewToModelMapper()
    }
    
    var movieUseCase: MovieUseCase {
        return MovieUseCase(movieRepository: movieDataRepository)
    }
}
