dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
    username = "root"
    password = "Riy@dh11534"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost:3306/eticket?useUnicode=yes&characterEncoding=UTF-8"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/test_eticket"
        }
    }
    production {
        dataSource {
            pooled = false
            //dbCreate = "update"
            //url = "jdbc:mysql://localhost:3306/eticket?useUnicode=yes&characterEncoding=UTF-8"
            jndiName="jdbc/MySQLDataSource"
        }
    }
}
