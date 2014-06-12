package com.maritimeco

class User {

    String userId
    String password
    String level
    Date dateCreated
    Date lastUpdated
    
    static constraints = {
        userId(size:3..20, unique: true, blank:false)
        password(blank:false, validator: { password, user ->
            return password != user.userId})
        level(blank:false)
    }
    
    static hasMany = [tickets : Ticket]
}
