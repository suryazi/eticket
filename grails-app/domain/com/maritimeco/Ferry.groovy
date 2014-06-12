package com.maritimeco

class Ferry {

    String fName
    Integer pax
    Integer cars
    Integer dyna
    Integer wPax
    Integer wCars
    Integer wDyna
    Integer rPax
    Integer rCars
    Integer rDyna
    Integer vip
    Date dateCreated
    Date lastUpdated
    
    static constraints = {
        fName(blank:false, unique:true)
        pax(blank:false)
        cars(blank:false)
        dyna(blank:false)
        wPax(nullable:true)
        wCars(nullable:true)
        wDyna(nullable:true)
        rPax(nullable:true)
        rCars(nullable:true)
        rDyna(nullable:true)
        vip(nullable:true)
    }
    
    static hasMany = [tickets : Ticket, trips : Trip]
}
