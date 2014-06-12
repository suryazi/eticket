package com.maritimeco

class AdminController {
    
    static navigation = [
        [group:'tabs', action:'logout', order:10, isVisible:{session.user != null}]
    ]
    
    def defaultAction = 'login'

    def login = {
        if (request.get) {
            return // render the login view
        }    
        def user = User.findByUserId(params.userId)
        if (user) {
            if (user.password == params.password.encodeAsSHA256()) {
                session.user = user
                redirect(controller:"ticket", action: "create")
            }
            else {
                flash.message ="password incorrect"
                render(view: "login")
            }
        }
        else {
            flash.message="User not found"
            render(view: "login")
        }
    }
    
    def logout = {
        
        session.user = null
        flash.message = "Logout successfully"
        redirect(action:"login")
        
    }
    
    def index ={
        redirect(action:"login")
    }
}
