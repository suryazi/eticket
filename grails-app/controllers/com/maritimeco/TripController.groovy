package com.maritimeco

import grails.converters.JSON

class TripController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    static navigation = [
        [group:'tabs', order:6, title:'Trip', action: 'create', isVisible:{session.user != null && session.user.level =='Admin'}],
        [order:8, title:'Report', action: 'report', isVisible:{session.user != null && session.user.level == 'Admin'}]
    ]
    
    def report = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def tripInstance = new Trip()
        tripInstance.properties = params
        return [tripInstance: tripInstance]
    }
    
    
    def print = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def tripInstance = Trip.get(params.trips_id)
        if (!tripInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trip.label', default: 'Trip'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tripInstance: tripInstance]
        }
    }
    
    def tripAutoComplete = {
        
        def dateParser = new java.text.SimpleDateFormat("dd/MM/yyyy")
        def myFormat = 'dd/MM/yyyy'
        def td = new Date()
        if((params.query).size()>9 && (Date.parse(myFormat,params.query)>=Date.parse(myFormat, new Date().format('dd/MM/yyyy')))){
            td=dateParser.parse(params.query)
        }
        def trips = Trip.findAllByTDateBetweenAndTFrLike(td,td.plus(5),"${params.dependsOnValue}%")
        trips = trips.collect {
            //[id:it.id, tDate:"من: "+ it.tFr + " " + it.tDate]
            [id:it.id, tDate:"${it.tDate}"]
        }
        def jsonTrip = [
            trips: trips
        ]
        render jsonTrip as JSON
    }
    
    def tripRepAutoComplete = {
        
        def dateParser = new java.text.SimpleDateFormat("dd/MM/yyyy")
        def myFormat = 'dd/MM/yyyy'
        def td = new Date()
        if((params.query).size()>9 && (Date.parse(myFormat,params.query)<=Date.parse(myFormat, new Date().format('dd/MM/yyyy')))){
            td=dateParser.parse(params.query)
        }
        def trips = Trip.findAllByTDateBetweenAndTFrLike(td.minus(4),td.plus(1),"${params.dependsOnValue}%")
        //def trips = Trip.findAllByTDateLessThanEqualsAndTFrLike(td,"${params.dependsOnValue}%")
        trips = trips.collect {
            //[id:it.id, tDate:"من: "+ it.tFr + " " + it.tDate]
            [id:it.id, tDate:"${it.tDate}"]
        }
        def jsonTrip = [
            trips: trips
        ]
        render jsonTrip as JSON
    }
    
    /*def tripAutoComplete = {
        //def resultArray = (params.query).split()
        //println resultArray[0],resultArray[1]
        //def trips = Trip.findAllByTFrLike("${params.query}%")
        def trips = Trip.findAllByTDateGreaterThanEqualsAndTFrLike(new Date(),"${params.dependsOnValue}%")
        trips = trips.collect {
            //[id:it.id, tDate:"من: "+ it.tFr + " " + it.tDate]
            [id:it.id, tDate:it.tDate]
        }
        def jsonTrip = [
            trips: trips
        ]
        render jsonTrip as JSON
    }*/

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tripInstanceList: Trip.list(params), tripInstanceTotal: Trip.count()]
    }

    def create = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def tripInstance = new Trip()
        tripInstance.properties = params
        return [tripInstance: tripInstance]
    }

    def save = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def tripInstance = new Trip()
        bindData(tripInstance, params, ['ferry_id', 'ferry'])
        tripInstance.ferry = Ferry.get(params.ferry_id)
        /*def dateParser = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm")
        tripInstance.tFr = params.fr
        //bindData(tripInstance, params, ['ferry_id', 'ferry','tDate'])
        tripInstance.ferry = Ferry.get(params.ferry_id)
        //if(params.tDate){
          //  tripInstance.tDate=new Date(params.tDate)
        //}
        if(params.tDate){
            tripInstance.tDate=dateParser.parse(params.tDate)
            params.remove('tDate')
        }*/
        if (tripInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'trip.label', default: 'Trip'), tripInstance.id])}"
            redirect(action: "show", id: tripInstance.id)
        }
        else {
            render(view: "create", model: [tripInstance: tripInstance])
        }
    }

    def show = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def tripInstance = Trip.get(params.id)
        if (!tripInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trip.label', default: 'Trip'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tripInstance: tripInstance]
        }
    }

    def edit = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def tripInstance = Trip.get(params.id)
        if (!tripInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trip.label', default: 'Trip'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tripInstance: tripInstance]
        }
    }

    def update = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def tripInstance = Trip.get(params.id)
        if (tripInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tripInstance.version > version) {
                    
                    tripInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'trip.label', default: 'Trip')] as Object[], "Another user has updated this Trip while you were editing")
                    render(view: "edit", model: [tripInstance: tripInstance])
                    return
                }
            }
            tripInstance.properties = params
            if (!tripInstance.hasErrors() && tripInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'trip.label', default: 'Trip'), tripInstance.id])}"
                redirect(action: "show", id: tripInstance.id)
            }
            else {
                render(view: "edit", model: [tripInstance: tripInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trip.label', default: 'Trip'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def tripInstance = Trip.get(params.id)
        if (tripInstance) {
            try {
                tripInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'trip.label', default: 'Trip'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'trip.label', default: 'Trip'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'trip.label', default: 'Trip'), params.id])}"
            redirect(action: "list")
        }
    }
}
