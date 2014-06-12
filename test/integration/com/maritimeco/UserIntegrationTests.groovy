package com.maritimeco

import grails.test.*

class UserIntegrationTests extends GroovyTestCase {
    
    void testFirstSaveEver() {
        def user = new User(userId: 'joe', password: 'secret', level: 'admin')
        assertNotNull user.save()
        assertNotNull user.id
        def foundUser =user.get(user.id)
        assertEquals 'joe', foundUser.userId
    }
    
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

    }
}
