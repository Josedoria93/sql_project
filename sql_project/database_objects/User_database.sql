USE empresa_ferretera;

-- Crear el rol DBA con todos los permisos
DROP ROLE IF EXISTS 'DBA';
CREATE ROLE 'DBA';

-- Otorgar todos los permisos al rol DBA
GRANT ALL PRIVILEGES ON empresa_ferretera.* TO 'DBA';

-- Crear el usuario con la contraseña especificada
DROP USER IF EXISTS 'josedp'@'%';
CREATE USER 'josedp'@'%' IDENTIFIED BY '1594';

-- Configurar políticas de seguridad para el usuario

-- Configurar el número máximo de intentos fallidos de inicio de sesión
ALTER USER 'josedp'@'%' FAILED_LOGIN_ATTEMPTS 4;

-- Configurar la expiración de la contraseña
ALTER USER 'josedp'@'%' PASSWORD EXPIRE INTERVAL 30 DAY;

-- Configurar el tiempo de bloqueo de la cuenta después de fallar los intentos de inicio de sesión
ALTER USER 'josedp'@'%' PASSWORD_LOCK_TIME 3;

-- Otorgar el rol DBA al usuario
GRANT 'DBA' TO 'josedp'@'%';

-- Establecer el rol DBA como el rol por defecto para el usuario
SET DEFAULT ROLE 'DBA' TO 'josedp'@'%';

-- Actualizar los privilegios
FLUSH PRIVILEGES;

