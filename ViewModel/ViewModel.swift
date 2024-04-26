import Foundation

class ViewModel : ObservableObject {
    
    @Published var linguagens: [Linguagens] = []
    
    func fetchLinguagens(){
        guard let url = URL(string: "http://192.168.128.78:1880/buscar") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            do {
                let jsonDecodificado = try JSONDecoder().decode([Linguagens].self, from: data)
                
                DispatchQueue.main.async {
                    self?.linguagens = jsonDecodificado
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchLinguagensPorCategoria(for category: String?) {
          guard let category = category,
                let url = URL(string: "http://192.168.128.78:1880/buscar") else {
              return
          }
          let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
              guard let data = data, error == nil else {
                  return
              }
              do {
                  let jsonDecodificado = try JSONDecoder().decode([Linguagens].self, from: data)
                  
                  DispatchQueue.main.async {
                      self?.linguagens = jsonDecodificado.filter { $0.categoria == category }
                  }
              } catch {
                  print(error)
              }
          }
          
          task.resume()
      }
}

