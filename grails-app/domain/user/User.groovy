package user

import account.Account
import blog.BlogEntry
import ip.IpAddress
import region.City

class User {

	transient springSecurityService

    Account account
	String username
	String password
    String email
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static transients = ['springSecurityService']

    static hasMany = [blogs: BlogEntry, likes: BlogEntry]
    static mappedBy = [blogs: "author", likes: "likes"]

    static constraints = {
		username blank: false, unique: true
		password blank: false
        email nullable: true
        account blank: true, nullable: true
	}

	static mapping = {
		password column: '`password`'
	}

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

	def beforeInsert() {
        this.account = new Account().save()
        encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

    def getTwitterUser(){
        if(this.id){
            return TwitterUser.findByUser(this)
        }
        return null
    }
}
