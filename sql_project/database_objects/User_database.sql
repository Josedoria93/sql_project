USE empresa_ferretera;

-- Crearemos 1 rol que tiene todos los permisos

DROP ROLE IF EXISTS 'DBA';
CREATE ROLE 'DBA';

-- Se Otorgan los permisos

-- ROL DBA
-- Todos los permisos
GRANT ALL PRIVILEGES ON empresa_ferretera.* TO 'DBA';

-- Creación de usuarios
	
-- DBA
DROP USER IF EXISTS
	'josedp'@'%',
	

CREATE USER 'josedp'@'%' IDENTIFIED BY '1594'
	FAILED_LOGIN_ATTEMPTS 4
	PASSWORD_LOCK_TIME 3
	PASSWORD EXPIRE INTERVAL 200 DAY;

-- Se Otorgan los roles

GRANT 'DBA' TO
	'josedp'@'%';

-- Activación de roles por defecto

SET DEFAULT ROLE 'DBA'
	TO 'josedp'@'%';

-- Actualización de privilegios

FLUSH PRIVILEGES;
