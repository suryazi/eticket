package com.maritimeco

class TicketController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", board: "POST"]
    
    static navigation = [
        [group:'tabs', order:1, title:'Ticket', action: 'create', isVisible:{session.user != null}],
        [             order:2, title:'Boarding', action: 'boarding', isVisible:{session.user != null}]
    ]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ticketInstanceList: Ticket.list(params), ticketInstanceTotal: Ticket.count()]
    }

    def create = {
        def ticketInstance = new Ticket()
        ticketInstance.properties = params
        return [ticketInstance: ticketInstance]
    }
    
    def boarding={
        
    }
    
    def board = {
        
        def ticketInstance = Ticket.get(params.id)
        def trips = Trip.get(ticketInstance.trip.id)
        if (!(trips.tDate > new Date()-1 && trips.tDate < new Date())){
            flash.message = "Date not matching"
            redirect(action:"boarding")
            return
        }
        //checking for waiting list passengers
        def ferry = Ferry.get(trips.ferry.id)
        def nop = Ticket.countByTripAndBoard(trips,"Y")
        if(nop >= ferry.pax){
            flash.message = "Ferry full"
            redirect(action:"boarding")
            return
        }
        ticketInstance.board="Y"
        ticketInstance.save(flush:true)
        flash.message = "Boarded"
        redirect(action:"boarding")
    }

    def save = {
        
            def ticketInstance = new Ticket()
            def trips = Trip.get(params.trips_id)
            def fer = Ferry.get(trips.ferry.id)
            def nop = Ticket.countByTripAndTClass(trips,params.tClass)
            def pas = Pax.findByPId(params.pId)
            if (Pax.countBypId(params.pId)<1){
                flash.message = "Passenger Not Found"
                render(view: "create", model: [ticketInstance: ticketInstance])
            }
            if((params.pltNo).size() > 0){
                    if (Car.countByPltNo(params.pltNo)<1){
                        flash.message = "Car Not Found"
                        render(view: "create", model: [ticketInstance: ticketInstance])
                    }
            }
            //Restricting double ticket for the same Trip & Pax

            def tic = Ticket.withCriteria {
                        pax{
                            eq("id",pas.id)
                        }
                        trip{
                                eq("id",trips.id)
                            }
                    }
            if (tic.size()>0){
                flash.message = "passenger was already issued ticket"
                render(view: "create", model: [ticketInstance: ticketInstance])
                return
            }
        
            if (session.user?.level == 'Admin'){
                //checking for passengers
                if (params.tClass == 'ثانية'){
                    def wp = Ticket.countByTripAndRemLike(trips,"WL%")
                    if((nop-wp) >= (fer.pax+fer.rPax)){
                        if(wp >= fer.wPax){
                            flash.message = "Passenger full! Ticket cannot be issued"
                            render(view: "create", model: [ticketInstance: ticketInstance])
                            return
                        }
                        ticketInstance.rem = "WL ${wp+1}"
                    }
                }else{
                    if(nop >= fer.vip){
                        flash.message = "VIP passenger full! Ticket cannot be issued"
                        render(view: "create", model: [ticketInstance: ticketInstance])
                        return
                    }
                }

                /*testing code
                def nop = Ticket.withCriteria {
                    trip{
                        eq("id",trips.id)
                        ferry {
                            eq("id",fer.id)
                        }
                    }
                }
                flash.message = "${nop}"
                def test = Ticket.findAllByTripAndCar(trips,cars)*/

                //checking for cars & dyna
                if((params.pltNo).size() > 0){
                    def cars = Car.findByPltNo(params.pltNo)
                    def noc = Ticket.withCriteria {
                        trip{
                            eq("id",trips.id)
                        }
                        car{
                            eq("typ", cars.typ)
                        }
                    }
                    if(cars.typ  == 'car'){
                        def wc = Ticket.countByTripAndRemLike(trips,"WLC%")
                        if((noc.size()-wc)>=(fer.cars+fer.rCars)){
                            if (wc >= fer.wCars){
                                flash.message = "Cars full! Ticket cannot be issued"
                                render(view: "create", model: [ticketInstance: ticketInstance])
                                return
                            }
                            ticketInstance.rem = "WLC ${wp+1}"
                        }
                    }
                    if (cars.typ == 'dyna'){
                        def wd = Ticket.countByTripAndRemLike(trips,"WLD%")
                        if((noc.size()-wd)>=(fer.dyna+fer.rDyna)){
                            if(wd >= fer.wDyna){
                                flash.message = "Dyna full! Ticket cannot be issued"
                                render(view: "create", model: [ticketInstance: ticketInstance])
                                return
                            }
                            ticketInstance.rem = "WLD ${wp+1}"
                        }
                    }
                }
            } else{

                //Blacklist
                def bl = Ticket.withCriteria {
                            pax{
                                eq("id",pas.id)
                            }
                            eq("board","N")
                            sqlRestriction "rem is null"
                            trip{
                                    between("tDate",new Date()-14,new Date())
                                }
                        }
                if (bl.size()>0){
                    flash.message = "Passenger black listed"
                    render(view: "create", model: [ticketInstance: ticketInstance])
                    return
                }

                //checking for passengers
                def wp = Ticket.countByTripAndRemLike(trips,"WL%")
                if(nop >= fer.pax){
                    if(wp >= fer.wPax){
                        flash.message = "Passenger full! Ticket cannot be issued"
                        render(view: "create", model: [ticketInstance: ticketInstance])
                        return
                    }
                    ticketInstance.rem = "WL ${wp+1}"
                }

                /*testing code
                def nop = Ticket.withCriteria {
                    trip{
                        eq("id",trips.id)
                        ferry {
                            eq("id",fer.id)
                        }
                    }
                }
                flash.message = "${nop}"
                def test = Ticket.findAllByTripAndCar(trips,cars)*/

                //checking for cars & dyna
                if((params.pltNo).size() > 0){
                    def cars = Car.findByPltNo(params.pltNo)
                    def noc = Ticket.withCriteria {
                        trip{
                            eq("id",trips.id)
                        }
                        car{
                            eq("typ", cars.typ)
                        }
                    }
                    if(cars.typ  == 'car'){
                        if(noc.size()>=fer.cars){
                            def wc = Ticket.countByTripAndRemLike(trips,"WLC%")
                            if (wc >= fer.wCars){
                                flash.message = "Cars full! Ticket cannot be issued"
                                render(view: "create", model: [ticketInstance: ticketInstance])
                                return
                            }
                            ticketInstance.rem = "WLC ${wp+1}"
                        }
                    }
                    if (cars.typ == 'dyna'){
                        if(noc.size()>=fer.dyna){
                            def wd = Ticket.countByTripAndRemLike(trips,"WLD%")
                            if(wd >= fer.wDyna){
                                flash.message = "Dyna full! Ticket cannot be issued"
                                render(view: "create", model: [ticketInstance: ticketInstance])
                                return
                            }
                            ticketInstance.rem = "WLD ${wp+1}"
                        }
                    }
                }
            }
            //render(view: "results")
            //render result.size()
            //bindData(ticketInstance,params,['pax','trip','car','dateCreated','lastupdated'])
            ticketInstance.pax = pas
            if ((params.pltNo).size() > 0){
                ticketInstance.car = Car.findByPltNo(params.pltNo)
            }
            ticketInstance.trip = Trip.get(params.trips_id)
            ticketInstance.tClass = params.tClass
            ticketInstance.user = session.user
            ticketInstance.dateCreated = new Date()
            ticketInstance.lastupdated = new Date()

            if (ticketInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.created.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])}"
                redirect(action: "show", id: ticketInstance.id)
            }
            else {
                render(view: "create", model: [ticketInstance: ticketInstance])
            }
    }

    def show = {
        def ticketInstance = Ticket.get(params.id)
        if (!ticketInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ticketInstance: ticketInstance]
        }
    }

    def edit = {
        if (session.user?.level != 'Admin'){
            redirect(action:"create")
        }
        def ticketInstance = Ticket.get(params.id)
        if (!ticketInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ticketInstance: ticketInstance]
        }
    }

    def update = {
        if (session.user?.level != 'Admin'){
            redirect(action:"create")
        }
        def ticketInstance = Ticket.get(params.id)
        if (ticketInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ticketInstance.version > version) {
                    
                    ticketInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ticket.label', default: 'Ticket')] as Object[], "Another user has updated this Ticket while you were editing")
                    render(view: "edit", model: [ticketInstance: ticketInstance])
                    return
                }
            }
            ticketInstance.properties = params
            if (!ticketInstance.hasErrors() && ticketInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])}"
                redirect(action: "show", id: ticketInstance.id)
            }
            else {
                render(view: "edit", model: [ticketInstance: ticketInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        if (session.user?.level != 'Admin'){
            redirect(action:"create")
        }
        def ticketInstance = Ticket.get(params.id)
        if (ticketInstance) {
            try {
                ticketInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def error={
        
    }
    
    def results = {
        
        //def nop = Ticket.withCriteria{
          //  projections {
            //    count('trip')
            //}
        //}
        //return [nop : nop]
        def trips = Trip.findAllByTFr('جازان')
        def tickets = Ticket.findAllByTrip(trips)
        return [ tickets : tickets, term : params.ticketId]
        
    }
}
