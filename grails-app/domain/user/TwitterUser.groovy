package user

import blog.BlogEntry
import grails.util.Holders
import ip.IpAddress
import region.City

class TwitterUser  {

    /**
     * Twitter Username (notice that it could be modified by user, Twitter allows that)
     */
    String username

    /**
     * Twitter User Id
     */
    Long twitterId

    /**
     * Twitter API token
     */
    String token

    /**
     * Twitter API secret
     */
    String tokenSecret

    /**
     * Related to main App User
     */
    static belongsTo = [user: user.User]

    static hasMany = [ips: IpAddress, cities: City]

    static constraints = {
        twitterId(unique: true, nullable: false)
        username(nullable: false, blank: false)
        ips nullable: true
        cities nullable: true
    }

}