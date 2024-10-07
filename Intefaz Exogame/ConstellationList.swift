//
//  ConstellationList.swift
//  Intefaz Exogame
//
//  Created by iOS Lab on 05/10/24.
//

import Foundation
import SwiftUI




let cassiopeiaConstellation = Constellation(
    name: "Cassiopeia",
    stars: [

            Star(position: CGPoint(x: 37.38, y: 100)),
            Star(position: CGPoint(x: 123.25, y: 320)),
            Star(position: CGPoint(x: 216.10, y: 300)),
            Star(position: CGPoint(x: 291.10, y: 570)),
            Star(position: CGPoint(x: 400, y: 450)),
        
    ],
    trapStars: [
        Star(position: CGPoint(x: 100, y: 200)), // Trampa
        Star(position: CGPoint(x: 180, y: 280)),
        Star(position: CGPoint(x: 100, y: 80)),
        Star(position: CGPoint(x: 600, y: 350)),
        Star(position: CGPoint(x: 250, y: 600)),
        Star(position: CGPoint(x: 70, y: 450)),
        Star(position: CGPoint(x: 400, y: 300)),
        Star(position: CGPoint(x: 550, y: 220)),
        Star(position: CGPoint(x: 15, y: 180)),
        Star(position: CGPoint(x: 330, y: 60)),// Trampa
    ],
    connections: [
    
            (from: Star(position: CGPoint(x: 37.38, y: 100)), to: Star(position: CGPoint(x: 123.25, y: 320))),
            (from: Star(position: CGPoint(x: 123.25, y: 320)), to: Star(position: CGPoint(x: 216.10, y: 300))),
            (from: Star(position: CGPoint(x: 216.10, y: 300)), to: Star(position: CGPoint(x: 291.10, y: 570))),
            (from: Star(position: CGPoint(x: 291.10, y: 570)), to: Star(position: CGPoint(x: 400, y: 450))),
            
        
        ]

)
let taurusConstellation = Constellation(
    name: "Taurus",
    stars: [
        Star(position: CGPoint(x: 90, y: 130)),
        Star(position: CGPoint(x: 140, y: 170)),
        Star(position: CGPoint(x: 190, y: 190)),
        Star(position: CGPoint(x: 250, y: 210)),
        Star(position: CGPoint(x: 290, y: 250)),
    ],
    trapStars: [
        Star(position: CGPoint(x: 110, y: 150)), // Trampa
        Star(position: CGPoint(x: 230, y: 220)),
        Star(position: CGPoint(x: 150, y: 45)),
        Star(position: CGPoint(x: 320, y: 220)),
        Star(position: CGPoint(x: 500, y: 390)),
        Star(position: CGPoint(x: 75, y: 570)),
        Star(position: CGPoint(x: 400, y: 300)),
        Star(position: CGPoint(x: 250, y: 100)),
        Star(position: CGPoint(x: 600, y: 480)),
        Star(position: CGPoint(x: 20, y: 350)),
        Star(position: CGPoint(x: 450, y: 50)),
        Star(position: CGPoint(x: 300, y: 600)),
        Star(position: CGPoint(x: 10, y: 120)),
        Star(position: CGPoint(x: 260, y: 430)),
        Star(position: CGPoint(x: 540, y: 220)),
        Star(position: CGPoint(x: 190, y: 50)),
        Star(position: CGPoint(x: 370, y: 330)),
        Star(position: CGPoint(x: 580, y: 80)),
        Star(position: CGPoint(x: 80, y: 520)),
        Star(position: CGPoint(x: 430, y: 150)),
        Star(position: CGPoint(x: 300, y: 410)),
      

// Trampa
    ],
    connections: [
        (from: Star(position: CGPoint(x: 90, y: 130)), to: Star(position: CGPoint(x: 140, y: 170))),
        (from: Star(position: CGPoint(x: 140, y: 170)), to: Star(position: CGPoint(x: 190, y: 190))),
        (from: Star(position: CGPoint(x: 190, y: 190)), to: Star(position: CGPoint(x: 250, y: 210))),
        (from: Star(position: CGPoint(x: 250, y: 210)), to: Star(position: CGPoint(x: 290, y: 250))),
    ]
)

let ursaMajorConstellation = Constellation(
    name: "Ursa Major",
    stars: [
        Star(position: CGPoint(x:350,y:60 )),
        Star(position: CGPoint(x:350,y:175 )),
        Star(position: CGPoint(x:300,y:260 )),
        Star(position: CGPoint(x:250,y: 350)),
        Star(position: CGPoint(x:150,y:360 )),
        Star(position: CGPoint(x:120,y:525 )),
        Star(position: CGPoint(x:220,y:560 )),
    ],
    trapStars: [
        Star(position: CGPoint(x: 100, y: 150)), // Trampa
        Star(position: CGPoint(x: 180, y: 260)),
        Star(position: CGPoint(x: 140, y: 250)),
        Star(position: CGPoint(x: 380, y: 410)),
        Star(position: CGPoint(x: 490, y: 130)),
        Star(position: CGPoint(x: 300, y: 520)),
        Star(position: CGPoint(x: 450, y: 190)),
        
        Star(position: CGPoint(x: 480, y: 400)),
        Star(position: CGPoint(x: 390, y: 280))
// Trampa
    ],
    connections: [
        (from: Star(position: CGPoint(x: 350, y: 60)), to: Star(position: CGPoint(x: 350, y: 175))), // 1 a 2
        (from: Star(position: CGPoint(x: 350, y: 175)), to: Star(position: CGPoint(x: 300, y: 260))), // 2 a 3
        (from: Star(position: CGPoint(x: 300, y: 260)), to: Star(position: CGPoint(x: 250, y: 350))), // 3 a 4
        (from: Star(position: CGPoint(x: 250, y: 350)), to: Star(position: CGPoint(x: 150, y: 360))), // 4 a 5
        (from: Star(position: CGPoint(x: 150, y: 360)), to: Star(position: CGPoint(x: 120, y: 525))), // 5 a 6
        (from: Star(position: CGPoint(x: 120, y: 525)), to: Star(position: CGPoint(x: 220, y: 560))), // 6 a 7
        (from: Star(position: CGPoint(x: 220, y: 560)), to: Star(position: CGPoint(x: 250, y: 350)))  // 7 a 4
    ]
)

let ursaMinorConstellation = Constellation(
    name: "Constellation",
    stars: [
        Star(position: CGPoint(x: 100, y: 300)),
        Star(position: CGPoint(x: 170, y: 260)),
        Star(position: CGPoint(x: 190, y: 200)),
        Star(position: CGPoint(x: 240, y: 180)),
        Star(position: CGPoint(x: 280, y: 120)),
    ],
    trapStars: [
        Star(position: CGPoint(x: 110, y: 220)), // Trampa
        Star(position: CGPoint(x: 130, y: 280)),
        Star(position: CGPoint(x: 75, y: 560)),
        Star(position: CGPoint(x: 210, y: 500)),
        Star(position: CGPoint(x: 380, y: 240)),
        Star(position: CGPoint(x: 440, y: 30)),
        Star(position: CGPoint(x: 550, y: 480)),
        Star(position: CGPoint(x: 5, y: 340)),
        Star(position: CGPoint(x: 310, y: 70)),
        Star(position: CGPoint(x: 580, y: 150))// Trampa
    ],
    connections: [
        (from: Star(position: CGPoint(x: 100, y: 300)), to: Star(position: CGPoint(x: 170, y: 260))),
        (from: Star(position: CGPoint(x: 170, y: 260)), to: Star(position: CGPoint(x: 190, y: 200))),
        (from: Star(position: CGPoint(x: 190, y: 200)), to: Star(position: CGPoint(x: 240, y: 180))),
        (from: Star(position: CGPoint(x: 240, y: 180)), to: Star(position: CGPoint(x: 280, y: 120))),
    ]
)

let dracoConstellation = Constellation(
    name: "Constellation",
    stars: [
        Star(position: CGPoint(x: 110, y: 110)),
        Star(position: CGPoint(x: 150, y: 140)),
        Star(position: CGPoint(x: 200, y: 170)),
        Star(position: CGPoint(x: 250, y: 180)),
        Star(position: CGPoint(x: 300, y: 220)),
    ],
    trapStars: [
        Star(position: CGPoint(x: 120, y: 130)), // Trampa
        Star(position: CGPoint(x: 210, y: 190)),
        Star(position: CGPoint(x: 125, y: 375)),
        Star(position: CGPoint(x: 220, y: 45)),
        Star(position: CGPoint(x: 490, y: 290)),
        Star(position: CGPoint(x: 305, y: 450)),
        Star(position: CGPoint(x: 60, y: 230)),
        Star(position: CGPoint(x: 530, y: 390)),
        Star(position: CGPoint(x: 395, y: 100)),
     
// Trampa
    ],
    connections: [
        (from: Star(position: CGPoint(x: 110, y: 110)), to: Star(position: CGPoint(x: 150, y: 140))),
        (from: Star(position: CGPoint(x: 150, y: 140)), to: Star(position: CGPoint(x: 200, y: 170))),
        (from: Star(position: CGPoint(x: 200, y: 170)), to: Star(position: CGPoint(x: 250, y: 180))),
        (from: Star(position: CGPoint(x: 250, y: 180)), to: Star(position: CGPoint(x: 300, y: 220))),
    ]
)

let geminiConstellation = Constellation(
    name: "Constellation",
    stars: [
        Star(position: CGPoint(x: 130, y: 250)),
        Star(position: CGPoint(x: 180, y: 270)),
        Star(position: CGPoint(x: 220, y: 300)),
        Star(position: CGPoint(x: 260, y: 320)),
        Star(position: CGPoint(x: 300, y: 350)),
    ],
    trapStars: [
        Star(position: CGPoint(x: 140, y: 230)), // Trampa
        Star(position: CGPoint(x: 270, y: 330)),
        Star(position: CGPoint(x: 220, y: 260)),
        Star(position: CGPoint(x: 530, y: 560)),
        Star(position: CGPoint(x: 15, y: 290)),
        Star(position: CGPoint(x: 470, y: 70)),
        Star(position: CGPoint(x: 350, y: 500)),
        Star(position: CGPoint(x: 600, y: 200))// Trampa
    ],
    connections: [
        (from: Star(position: CGPoint(x: 130, y: 250)), to: Star(position: CGPoint(x: 180, y: 270))),
        (from: Star(position: CGPoint(x: 180, y: 270)), to: Star(position: CGPoint(x: 220, y: 300))),
        (from: Star(position: CGPoint(x: 220, y: 300)), to: Star(position: CGPoint(x: 260, y: 320))),
        (from: Star(position: CGPoint(x: 260, y: 320)), to: Star(position: CGPoint(x: 300, y: 350))),
    ]
)


let orionConstellation = Constellation(
    name: "Constellation",
    stars: [
        
            Star(position: CGPoint(x: 72.72, y: 500)),
            Star(position: CGPoint(x: 181.81, y: 700)),
            Star(position: CGPoint(x: 192.73, y: 400)),
            Star(position: CGPoint(x: 188.64, y: 300)),
            Star(position: CGPoint(x: 148.18, y: 310)),
            Star(position: CGPoint(x: 272.73, y: 150)),
            Star(position: CGPoint(x: 363.64, y: 300)),
            Star(position: CGPoint(x: 400, y: 100)),
            Star(position: CGPoint(x: 290.91, y: 450)),
            Star(position: CGPoint(x: 254.55, y: 0)),
            Star(position: CGPoint(x: 181.81, y: 50)),
        

    ],
    trapStars: [
        Star(position: CGPoint(x: 80, y: 170)), // Trampa
        Star(position: CGPoint(x: 220, y: 290))
    ],
    connections: [
        
            (from: Star(position: CGPoint(x: 72.72, y: 500)), to: Star(position: CGPoint(x: 192.73, y: 400))), // 1 a 3
            (from: Star(position: CGPoint(x: 192.73, y: 400)), to: Star(position: CGPoint(x: 188.64, y: 300))), // 3 a 4
            (from: Star(position: CGPoint(x: 188.64, y: 300)), to: Star(position: CGPoint(x: 148.18, y: 310))), // 4 a 5
            (from: Star(position: CGPoint(x: 148.18, y: 310)), to: Star(position: CGPoint(x: 272.73, y: 150))), // 5 a 6
            (from: Star(position: CGPoint(x: 272.73, y: 150)), to: Star(position: CGPoint(x: 363.64, y: 300))), // 6 a 7
            (from: Star(position: CGPoint(x: 363.64, y: 300)), to: Star(position: CGPoint(x: 400, y: 100))), // 7 a 8
            (from: Star(position: CGPoint(x: 400, y: 100)), to: Star(position: CGPoint(x: 290.91, y: 450))), // 8 a 9
            (from: Star(position: CGPoint(x: 290.91, y: 450)), to: Star(position: CGPoint(x: 181.81, y: 700)))  // 9 a 2
        
    ]
)
