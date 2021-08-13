/*
 Abstract: This class handles data fetching of options chains
 */

import Foundation


let dates = [
    "2019-05-10",
          "2019-05-17",
          "2019-05-24",
          "2019-05-31",
          "2019-06-07",
          "2019-06-14",
          "2019-06-21",
          "2019-07-19",
          "2019-08-16",
          "2019-09-20",
          "2019-10-18",
          "2020-01-17",
          "2020-06-19",
          "2020-09-18",
          "2021-01-15",
          "2021-06-18"
]


class OptionsProvider {
    
    // Base Tradier API URL
    let baseURL = "https://api.tradier.com/v1/markets/options/"
    // Options chain url
    let chains = "chains?"
}
