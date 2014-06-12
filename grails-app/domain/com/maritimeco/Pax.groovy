package com.maritimeco

class Pax {

    String pId
    String pName
    String sex
    String nat
    Date dateCreated
    Date lastUpdated
    
    static constraints = {
        pId(size:5..10, blank:false, unique:true)
        pName(blank:false)
        sex(blank:false)
        nat(blank:false)
    }
    
    static hasMany = [tickets : Ticket]
}
