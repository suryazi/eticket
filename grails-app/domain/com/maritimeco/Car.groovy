package com.maritimeco

class Car {

    String pltNo
    String typ
    Date dateCreated
    Date lastUpdated
    
    static constraints = {
        pltNo(size:6..10, blank:false, unique:true)
        typ(blank:false)
    }
    
    static hasMany = [tickets : Ticket]
}
