//
//  productData.swift
//  AppleProducts
//
//  Created by 전민석 on 2023/07/04.
//

import Foundation

let iPhoneArray: [iPhone] = [
    iPhone(name: "iPhone 14 Pro", year: "2022", osVersion: 16.5, price: 1550000, image: "https://1801889e95b1f9bf.kinxzone.com/webfile/product/5/5230/b6600bje84b4.jpg", appleTVPlusCompatible: true, cameraPixel: 48),
    iPhone(name: "iPhone 13", year: "2021", osVersion: 16.5, price: 1090000, image: "https://www.jbhifi.com.au/cdn/shop/products/530256-Product-0-I-637672978949292954.jpg?v=1686263271", appleTVPlusCompatible: true, cameraPixel: 12),
    iPhone(name: "iPhone 12", year: "2020", osVersion: 16.5, price: 950000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-12-finish-select-202207-white?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1662150115751", appleTVPlusCompatible: true, cameraPixel: 12),
    iPhone(name: "iPhone SE (3rd Gen)", year: "2022", osVersion: 16.5, price: 650000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-se-finish-select-202207-product-red?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1655316263304", appleTVPlusCompatible: true, cameraPixel: 12),
    iPhone(name: "iPhone 11", year: "2019", osVersion: 16.5, price: 990000, image: "https://d2xamzlzrdbdbn.cloudfront.net/products/a0e4a716-1040-43a6-808c-817b38cc6c1d_416x416.jpg", appleTVPlusCompatible: true, cameraPixel: 12)
]

let iPadArray: [iPad] = [
    iPad(name: "Pro 11 4세대", year: "2022", osVersion: 16.0, price: 1249000, image: "https://www.apple.com/v/ipad-pro/al/images/specs/11_in_ipad_pro__c76swgrzq30i_large.jpg", appleTVPlusCompatible: true, cameraPixel: 1200),
    iPad(name: "Pro 12.9 6세대", year: "2022", osVersion: 16.0, price: 1729000, image: "https://www.apple.com/v/ipad-pro/al/images/specs/12_9_in_ipad_pro__c00ml6euxus2_large.jpg", appleTVPlusCompatible: true, cameraPixel: 1200),
    iPad(name: "Air 5세대", year: "2022", osVersion: 16.0, price: 929000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-air-finish-unselect-gallery-1-202207?wid=2560&hei=1440&fmt=p-jpg&qlt=95&.v=1654902977555", appleTVPlusCompatible: true, cameraPixel: 1200),
    iPad(name: "iPad 10세대", year: "2022", osVersion: 16.0, price: 679000, image: "https://www.apple.com/kr/ipad-10.9/b/images/overview/get-things-done/collaborate__d8727hjzrey6_large.jpg", appleTVPlusCompatible: true, cameraPixel: 1200),
    iPad(name: "mini 6세대", year: "2021", osVersion: 16.0, price: 769000, image: "https://www.apple.com/v/ipad-mini/q/images/shared-footer/accessories__de98p4odfw2u_large.png", appleTVPlusCompatible: true, cameraPixel: 1200)
]

let macArray: [Mac] = [
    Mac(name: "MacBook Air15" , year: "2023", osVersion: 13.4, price: 1890000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mba15-midnight-config-202306?wid=840&hei=508&fmt=jpeg&qlt=90&.v=1684340991333", appleTVPlusCompatible: true, cameraPixel: 1024),
    Mac(name: "MacBook Air13", year: "2022", osVersion: 13.4, price: 1590000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-midnight-select-20220606?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1653084303665", appleTVPlusCompatible: true, cameraPixel: 1080),
    Mac(name: "iMac 24", year: "2021", osVersion: 13.4, price: 1790000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/imac-24-blue-cto-hero-202104?wid=1254&hei=1132&fmt=jpeg&qlt=90&.v=1617479508000", appleTVPlusCompatible: true, cameraPixel: 1080),
    Mac(name: "MacBook Pro 13", year: "2022", osVersion: 13.4, price: 1790000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp-spacegray-select-202206_GEO_KR?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1664497359275", appleTVPlusCompatible: true, cameraPixel: 720),
    Mac(name: "MacBook Pro 16", year: "2023", osVersion: 13.4, price: 3490000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp16-spacegray-gallery7-202301?wid=4000&hei=3072&fmt=jpeg&qlt=90&.v=1670626224500", appleTVPlusCompatible: true, cameraPixel: 1080)
]

let appleWatchArray: [AppleWatch] = [
  AppleWatch(name: "Apple Watch SE", year: "2020", osVersion: 15.1, price: 359000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-card-40-se-202303_GEO_KR?wid=680&hei=528&fmt=png-alpha&.v=1677020555312", appleTVPlusCompatible: false, sensor: "on"),
  AppleWatch(name: "Apple Watch Series 8", year: "2019", osVersion: 15.2, price: 599000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-card-40-s8-202303_GEO_KR?wid=680&hei=528&fmt=jpeg&qlt=90&.v=1677020482896", appleTVPlusCompatible: false, sensor: "on"),
  AppleWatch(name: "Apple Watch Ultra", year: "2022", osVersion: 15.3, price: 1149000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-card-40-ultra-202209_GEO_KR?wid=680&hei=528&fmt=png-alpha&.v=1678733188783", appleTVPlusCompatible: false, sensor: "on"),
  AppleWatch(name: "Apple Watch Hermès", year: "2023", osVersion: 15.4, price: 1669000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-card-40-hermes-202303_GEO_KR?wid=680&hei=528&fmt=jpeg&qlt=90&.v=1677020378387", appleTVPlusCompatible: false, sensor: "on")
]

let appleTVArray: [AppleTV] = [
    AppleTV(name: "Apple TV 4K", year: "2022", osVersion: 16, price: 219000, image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/apple-tv-4k-hero-select-202210?wid=1076&hei=1070&fmt=jpeg&qlt=90&.v=1664896361408", appleTVPlusCompatible: true)
]
