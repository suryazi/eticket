package eticket

class SecurityFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                if (!session.user && actionName != "login") {
                    redirect(controller: "admin", action: "login")
                    return false
                }
            }
            after = {
                
            }
            afterView = {
                
            }
        }
    }
    
}
