def props = new Properties()

environments {
    development {
        new File("/deployments/properties/zombieinvasion.global/app-config.properties").withReader{
            props.load(it)
        }
    }
    test {
        new File("/deployments/properties/zombieinvasion.global/app-config.properties").withReader{
            props.load(it)
        }
    }
    production {
        grails.logging.jul.usebridge = false
        new File("/deployments/properties/zombieinvasion.global/app-config.properties").withReader{
            props.load(it)
        }
    }
}
def externalConfiguration = new ConfigSlurper().parse(props)

dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
    username = ""
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://${externalConfiguration.dataSource.host.ip}/${externalConfiguration.database.name}?useUnicode=yes&characterEncoding=UTF-8&autoReconnect=true&allowMultiQueries=true"
            properties {
                // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
                jmxEnabled = true
                initialSize = 5
                maxActive = 50
                minIdle = 5
                maxIdle = 25
                maxWait = 10000
                maxAge = 10 * 60000
                timeBetweenEvictionRunsMillis = 5000
                minEvictableIdleTimeMillis = 60000
                validationQuery = "SELECT 1"
                validationQueryTimeout = 3
                validationInterval = 15000
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false
                jdbcInterceptors = "ConnectionState"
                defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_UNCOMMITTED
            }
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://${externalConfiguration.dataSource.host.ip}/${externalConfiguration.database.name}?useUnicode=yes&characterEncoding=UTF-8&autoReconnect=true&allowMultiQueries=true"
            properties {
                // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
                jmxEnabled = true
                initialSize = 5
                maxActive = 50
                minIdle = 5
                maxIdle = 25
                maxWait = 10000
                maxAge = 10 * 60000
                timeBetweenEvictionRunsMillis = 5000
                minEvictableIdleTimeMillis = 60000
                validationQuery = "SELECT 1"
                validationQueryTimeout = 3
                validationInterval = 15000
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false
                jdbcInterceptors = "ConnectionState"
                defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_UNCOMMITTED
            }
        }
    }
    production {
        dataSource {
            dbCreate = "update"
        }
        url = "jdbc:mysql://${externalConfiguration.dataSource.host.ip}/${externalConfiguration.database.name}?useUnicode=yes&characterEncoding=UTF-8&autoReconnect=true&allowMultiQueries=true"
        properties {
            // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
            jmxEnabled = true
            initialSize = 5
            maxActive = 50
            minIdle = 5
            maxIdle = 25
            maxWait = 10000
            maxAge = 10 * 60000
            timeBetweenEvictionRunsMillis = 5000
            minEvictableIdleTimeMillis = 60000
            validationQuery = "SELECT 1"
            validationQueryTimeout = 3
            validationInterval = 15000
            testOnBorrow = true
            testWhileIdle = true
            testOnReturn = false
            jdbcInterceptors = "ConnectionState"
            defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_UNCOMMITTED
        }
    }
}
