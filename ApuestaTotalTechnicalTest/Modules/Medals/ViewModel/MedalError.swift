//
//  MedalError.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 29/10/25.
//

enum MedalError: Error {
    case syncFailed
    case incrementFailed
    case resetFailed
    case unknown(Error)

    var message: String {
        switch self {
        case .syncFailed: return "No se pudieron sincronizar las medallas."
        case .incrementFailed: return "Error al incrementar puntos."
        case .resetFailed: return "No se pudo reiniciar el progreso."
        case .unknown(let error): return error.localizedDescription
        }
    }
}
