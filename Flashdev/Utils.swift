import Foundation

extension Array where Element: Hashable {
    
    func after(_ item: Element) -> Element? {
        var index = self.firstIndex(where: { $0 == item })
        
        if( index != self.endIndex-1){
            index = index!.advanced (by: 1)
        }
        return self[index!]
    }
        
    func before(_ item: Element) -> Element? {
        var index = self.firstIndex (where: { $0 == item })
        
        if( index != 0){
            index = index!.advanced (by: -1)
        }
        
        return self[index!]
    }
}

