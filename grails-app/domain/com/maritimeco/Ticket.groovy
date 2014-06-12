package com.maritimeco

class Ticket {

    Pax pax
    Car car
    Trip trip
    String tClass
    String board = "N"
    String rem
    User user
    Date dateCreated
    Date lastupdated
    
    static constraints = {
        pax(blank:false)
        car(nullable: true)
        trip(blank:false)
        tClass(blank:false)
        board(blank:false)
        rem(nullable:true)
        user(blank:false)
    }
    
    static belongsTo = [User, Pax, Car, Trip]
    
    static mapping = {
        sort dateCreated: "desc"
    }
}
