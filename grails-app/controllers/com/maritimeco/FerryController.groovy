package com.maritimeco

import grails.converters.JSON

class FerryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    static navigation = [
        group:'tabs', order:7, title:'Ferry', action: 'create', isVisible:{session.user != null && session.user.level =='Admin'}
    ]
    
    def ferryAutoComplete = {
        def ferry = Ferry.findAllByFNameLike("${params.query}%")
        ferry = ferry.collect {
            [id:it.id, fName:it.fName]
        }
        def jsonFerry = [
            ferry: ferry
        ]
        render jsonFerry as JSON
    }
    
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ferryInstanceList: Ferry.list(params), ferryInstanceTotal: Ferry.count()]
    }

    def create = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def ferryInstance = new Ferry()
        ferryInstance.properties = params
        return [ferryInstance: ferryInstance]
    }

    def save = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def ferryInstance = new Ferry(params)
        if (ferryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ferry.label', default: 'Ferry'), ferryInstance.id])}"
            redirect(action: "show", id: ferryInstance.id)
        }
        else {
            render(view: "create", model: [ferryInstance: ferryInstance])
        }
    }

    def show = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def ferryInstance = Ferry.get(params.id)
        if (!ferryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ferry.label', default: 'Ferry'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ferryInstance: ferryInstance]
        }
    }

    def edit = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def ferryInstance = Ferry.get(params.id)
        if (!ferryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ferry.label', default: 'Ferry'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ferryInstance: ferryInstance]
        }
    }

    def update = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def ferryInstance = Ferry.get(params.id)
        if (ferryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ferryInstance.version > version) {
                    
                    ferryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ferry.label', default: 'Ferry')] as Object[], "Another user has updated this Ferry while you were editing")
                    render(view: "edit", model: [ferryInstance: ferryInstance])
                    return
                }
            }
            ferryInstance.properties = params
            if (!ferryInstance.hasErrors() && ferryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ferry.label', default: 'Ferry'), ferryInstance.id])}"
                redirect(action: "show", id: ferryInstance.id)
            }
            else {
                render(view: "edit", model: [ferryInstance: ferryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ferry.label', default: 'Ferry'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        if (session.user?.level != 'Admin'){
            redirect(action:"index")
        }
        def ferryInstance = Ferry.get(params.id)
        if (ferryInstance) {
            try {
                ferryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ferry.label', default: 'Ferry'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ferry.label', default: 'Ferry'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ferry.label', default: 'Ferry'), params.id])}"
            redirect(action: "list")
        }
    }
}
