package com.maritimeco

import grails.converters.JSON

class PaxController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    static navigation = [
        group:'tabs', order:3, title:'Passenger', action: 'create', isVisible:{session.user != null}
    ]

    
    def search = {
        
    }
    
    def paxAutoComplete = {
            def pax = Pax.findAllByPIdLike("${params.query}%")
            pax = pax.collect {
                [id:it.id, pId:it.pId]
            }
            def jsonPax = [
                pax: pax
            ]
            render jsonPax as JSON
    }
    
    def results = {
        def pax = Pax.findAllByPIdLike("%${params.pId}%")
        return [pax: pax, term: params.pId]
    }


    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paxInstanceList: Pax.list(params), paxInstanceTotal: Pax.count()]
    }

    def create = {
        def paxInstance = new Pax()
        paxInstance.properties = params
        return [paxInstance: paxInstance]
    }

    def save = {
        def paxInstance = new Pax(params)
        paxInstance.pId = params.pId.trim()
        if (paxInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pax.label', default: 'Pax'), paxInstance.id])}"
            redirect(action: "show", id: paxInstance.id)
        }
        else {
            render(view: "create", model: [paxInstance: paxInstance])
        }
    }

    def show = {
        def paxInstance = Pax.get(params.id)
        if (!paxInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pax.label', default: 'Pax'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paxInstance: paxInstance]
        }
    }

    def edit = {
        def paxInstance = Pax.get(params.id)
        if (!paxInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pax.label', default: 'Pax'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paxInstance: paxInstance]
        }
    }

    def update = {
        def paxInstance = Pax.get(params.id)
        if (paxInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paxInstance.version > version) {
                    
                    paxInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pax.label', default: 'Pax')] as Object[], "Another user has updated this Pax while you were editing")
                    render(view: "edit", model: [paxInstance: paxInstance])
                    return
                }
            }
            paxInstance.properties = params
            if (!paxInstance.hasErrors() && paxInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pax.label', default: 'Pax'), paxInstance.id])}"
                redirect(action: "show", id: paxInstance.id)
            }
            else {
                render(view: "edit", model: [paxInstance: paxInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pax.label', default: 'Pax'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paxInstance = Pax.get(params.id)
        if (paxInstance) {
            try {
                paxInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pax.label', default: 'Pax'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pax.label', default: 'Pax'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pax.label', default: 'Pax'), params.id])}"
            redirect(action: "list")
        }
    }
}
