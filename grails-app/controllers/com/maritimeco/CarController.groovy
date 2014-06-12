package com.maritimeco

import grails.converters.JSON

class CarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    static navigation = [
        [group:'tabs', order:4, title:'Cars', action: 'create', isVisible:{session.user != null}],
        [order:5, title:'Pax&Cars', action: 'paxandcar', isVisible:{session.user != null}]
    ]
    
    def search = {
        
    }
    
    def results = {
        def car = Car.findAllByPltNoLike("%${params.pltno}%")
        return [car: car, term: params.pltno]
    }
    
    def carAutoComplete = {
            def cars = Car.findAllByPltNoLike("${params.query}%")
            cars = cars.collect {
                [id:it.id, pltNo:it.pltNo]
            }
            def jsonCar = [
                cars: cars
            ]
            render jsonCar as JSON
    }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [carInstanceList: Car.list(params), carInstanceTotal: Car.count()]
    }

    def create = {
        def carInstance = new Car()
        carInstance.properties = params
        return [carInstance: carInstance]
    }
    
    def paxandcar = {
        def paxInstance = new Pax()
        paxInstance.properties = params
        def carInstance = new Car()
        carInstance.properties = params
        return [paxInstance: paxInstance, carInstance: carInstance]
    }
    
    def pcsave = {
        def paxInstance = new Pax(params)
        def carInstance = new Car(params)
        if (params.pltNo.size() > 0 && params.pName.size() > 0){
            paxInstance.pId = params.pId.trim()
            carInstance.pltNo = params.pltNo.trim()
            if (paxInstance.save(flush: true)) {
                flash.message = "Passenger ${paxInstance.pId} is added"
            }
            else {
                render(view: "paxandcar", model: [paxInstance: paxInstance, carInstance: carInstance])
                return
            }
            if (carInstance.save(flush: true)) {
                redirect(action: "paxandcar")
            }
            else {
                render(view: "paxandcar", model: [paxInstance: paxInstance, carInstance: carInstance])
                return
            }
        }
        if (params.pName.size() > 0){
            paxInstance.pId = params.pId.trim()
            if (paxInstance.save(flush: true)) {
                flash.message = "Passenger ${paxInstance.pId} is added"
                redirect(action: "paxandcar")
            }
            else {
                render(view: "paxandcar", model: [paxInstance: paxInstance, carInstance: carInstance])
                return
            }
        }
        if (params.pltNo.size() > 0){
            carInstance.pltNo = params.pltNo.trim()
            if (carInstance.save(flush: true)) {
                flash.message = "Car ${carInstance.pltNo} is added"
                redirect(action: "paxandcar")
            }
            else {
                render(view: "paxandcar", model: [paxInstance: paxInstance, carInstance: carInstance])
                return
            }
        }
        
    }

    def save = {
        def carInstance = new Car(params)
        carInstance.pltNo = params.pltNo.trim()
        if (carInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'car.label', default: 'Car'), carInstance.id])}"
            redirect(action: "show", id: carInstance.id)
        }
        else {
            render(view: "create", model: [carInstance: carInstance])
        }
    }

    def show = {
        def carInstance = Car.get(params.id)
        if (!carInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
            redirect(action: "list")
        }
        else {
            [carInstance: carInstance]
        }
    }

    def edit = {
        if (session.user?.level != 'Admin'){
            redirect(action:"create")
        }
        def carInstance = Car.get(params.id)
        if (!carInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [carInstance: carInstance]
        }
    }

    def update = {
        if (session.user?.level != 'Admin'){
            redirect(action:"create")
        }
        def carInstance = Car.get(params.id)
        if (carInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (carInstance.version > version) {
                    
                    carInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'car.label', default: 'Car')] as Object[], "Another user has updated this Car while you were editing")
                    render(view: "edit", model: [carInstance: carInstance])
                    return
                }
            }
            carInstance.properties = params
            if (!carInstance.hasErrors() && carInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'car.label', default: 'Car'), carInstance.id])}"
                redirect(action: "show", id: carInstance.id)
            }
            else {
                render(view: "edit", model: [carInstance: carInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        if (session.user?.level != 'Admin'){
            redirect(action:"create")
        }
        def carInstance = Car.get(params.id)
        if (carInstance) {
            try {
                carInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
            redirect(action: "list")
        }
    }
}
