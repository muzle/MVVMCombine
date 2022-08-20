import Foundation
import Combine

final class PlaceRepository: PlaceRepositoryProtocol {
    
    // MARK: - Public methods
    
    func fetchPlaces() -> AnyPublisher<[Place], Error> {
        Deferred {
            Future { [self] future in
                DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds(1)) { [self] in
                    future(makePlacesOrError())
                }
                
            }
        }.eraseToAnyPublisher()
    }
}

// MARK: - Private methods

private extension PlaceRepository {
    func makePlacesOrError() -> Result<[Place], Error> {
        guard Bool.random() else { return .failure(PlaceRepositoryError.invalidState) }
        return .success(Place.makeMock())
    }
}

// MARK: - PlaceRepositoryError

private extension PlaceRepository {
    enum PlaceRepositoryError: LocalizedError {
        case invalidState
        
        var errorDescription: String? {
            switch self {
            case .invalidState: return "Invalid state"
            }
        }
    }
}

// MARK: - Place + mock

// swiftlint:disable line_length
fileprivate extension Place {
    static func makeMock() -> [Place] {
        [
            Place(
                imageUrl: "https://www.history.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTczMzMzNjYxODgwNDI4NDAz/washington-dc-gettyimages-74063516.jpg",
                name: "Washington, D.C.",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "https://www.gismeteo.ru/weather-washington-7150/"
            ),
            Place(
                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/New_york_times_square-terabass.jpg/500px-New_york_times_square-terabass.jpg",
                name: "New York City",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "https://www.gismeteo.ru/weather-new-york-7190/"
            ),
            Place(
                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/City_of_Omaha%2C_Nebraska_Skyline_on_the_Missouri_River_%2830899969517%29.jpg/800px-City_of_Omaha%2C_Nebraska_Skyline_on_the_Missouri_River_%2830899969517%29.jpg",
                name: "Omaha, Nebraska",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "https://www.gismeteo.ru/weather-omaha-7225/"
            ),
            Place(
                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Dallas%2C_Texas_Skyline_2005.jpg/400px-Dallas%2C_Texas_Skyline_2005.jpg",
                name: "Dallas",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "https://www.gismeteo.ru/weather-dallas-7101/"
            ),
            Place(
                imageUrl: " ",
                name: "Detroit",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "не рабочая ссылка"
            ),
            Place(
                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Miamimetroarea.jpg/800px-Miamimetroarea.jpg",
                name: "Miami",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "https://www.gismeteo.ru/weather-miami-7063/"
            ),
            Place(
                imageUrl: "https://cms.finnair.com/resource/blob/1397934/c4410bf39d8838d7285bc25be6d4183b/lax-main-data.jpg",
                name: "Los Angeles",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "https://www.gismeteo.ru/weather-los-angeles-7116/"
            ),
            Place(
                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/d/de/Houston_night.jpg",
                name: "Houston",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "https://www.gismeteo.ru/weather-houston-7090/"
            ),
            Place(
                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Indianapolis-1872528.jpg/1200px-Indianapolis-1872528.jpg",
                name: "Indianapolis",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "https://www.gismeteo.ru/weather-indianapolis-7166/"
            ),
            Place(
                imageUrl: "https://cdn.getyourguide.com/img/location/5ffeb496e3e09.jpeg/88.jpg",
                name: "Las Vegas",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "https://www.gismeteo.ru/weather-las-vegas-7146/"
            ),
            Place(
                imageUrl: "https://cdn.getyourguide.com/img/location/533597d7653a9.jpeg/88.jpg",
                name: "Boston",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                weatherUrl: "https://www.gismeteo.ru/weather-boston-7194/"
            )
        ]
    }
}
// swiftlint:enable line_length
