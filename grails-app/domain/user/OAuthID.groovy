package user

/**
 * Simple domain class that records the identities of users authenticating via
 * an OAuth provider. Each identity consists of the OAuth account name and the
 * name of the provider. It also has a reference to the corresponding Spring Security
 * user account, although only long IDs are supported at the moment.
 */
class OAuthID implements Serializable {

    String provider
    String accessToken

    static belongsTo = [user: User]

    static constraints = {
        accessToken unique: true
    }

    static mapping = {
        provider    index: "identity_idx"
        accessToken index: "identity_idx"
    }

}
