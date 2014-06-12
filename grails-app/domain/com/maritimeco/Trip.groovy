package com.maritimeco

class Trip {
    
    Ferry ferry
    String tFr
    Date tDate

    static constraints = {
        ferry (blank:false)
        tFr(blank:false)
        tDate(blank:false, validator: {return (it > new Date()-1)})
    }
    //For date w/o Time <g:datePicker name="startDate" value="${trip?.startDate}" years="${years}"  precision="day" />
    
    static hasMany = [tickets : Ticket]
    
    static mapping = {
        sort tDate:"asc"
    }
}
