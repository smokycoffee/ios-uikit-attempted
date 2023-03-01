//
//  ErrorMsgs.swift
//  movie-app-test
//
//  Created by Tsenguun on 1/3/23.
//

import Foundation

enum MovieError: String, Error {
    case invalidUrlLink     = "This link created an invalid request. Please try again"
    case unableToComplete   = "Unable to complete request. Please check your internet connection"
    case invalidResponse    = "Invalid response from server. Please try again"
    case invalidData        = "The data received from server was invalid. Please try again."
}
