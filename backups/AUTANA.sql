-- DROP TABLE categoria;

CREATE TABLE categoria
(
  id_categoria serial,
  categoria_nombre varchar(30),
  categoria_descripcion varchar(300),
  categoria_fecha_registro date,
  PRIMARY KEY (id_categoria)
);

-- DROP TABLE usuario;

CREATE TABLE usuario
(
  id_usuario serial,
  usuario_cedula varchar(120),
  usuario_nombre varchar(120),
  usuario_apellido varchar(120),
  usuario_sexo int,
  usuario_telefono varchar(120),
  usuario_correo varchar(50),
  usuario_direccion varchar(120),
  usuario_clave varchar(80),
  usuario_fecha_registro date,
  fk_categoria int,
  fecha_asignacion_de_categoria date,
  usuario_estado int,
  PRIMARY KEY (id_usuario),
  FOREIGN KEY (fk_categoria)
      REFERENCES categoria (id_categoria) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


-- DROP TABLE public.departamento;

CREATE TABLE departamento
(
  id_departamento serial,
  departamento_nombre varchar(120),
  departamento_descripcion varchar(120),
  departamento_fecha_registro date,
  PRIMARY KEY (id_departamento)
);

-- DROP TABLE usuario_departamento;

CREATE TABLE usuario_departamento
(
  id_usuario_departamento serial,
  fk_usuario int,
  fk_departamento int,
  usuario_departamento_fecha_registro date,
 PRIMARY KEY (id_usuario_departamento),
  FOREIGN KEY (fk_departamento)
      REFERENCES departamento (id_departamento) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (fk_departamento)
      REFERENCES departamento (id_departamento) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE rol;

CREATE TABLE rol
(
  id_rol serial,
  rol_nombre varchar(30),
  rol_descripcion varchar(30),
  rol_fecha_registro date,
  PRIMARY KEY (id_rol)
);

-- DROP TABLE usuario_rol;

CREATE TABLE usuario_rol
(
  id_usuario_rol serial,
  fk_usuario int,
  fk_rol int,
  usuario_rol_fecha_registro date,
  PRIMARY KEY (id_usuario_rol),
  FOREIGN KEY (fk_rol)
      REFERENCES rol (id_rol) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (fk_usuario)
      REFERENCES usuario(id_usuario) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


-- DROP TABLE modulo;

CREATE TABLE modulo
(
  id_modulo serial,
  modulo_nombre varchar(70),
  modulo_fecha_registro date,
  PRIMARY KEY (id_modulo)
);


-- DROP TABLE rol_modulo;

CREATE TABLE rol_modulo
(
  id_rol_modulo serial,
  fk_rol int,
  fk_modulo int,
  rol_modulo_fecha_registro date,
  PRIMARY KEY (id_rol_modulo),
  FOREIGN KEY (fk_modulo)
      REFERENCES modulo (id_modulo) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (fk_rol)
      REFERENCES rol (id_rol) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


-- DROP TABLE trabajo;

CREATE TABLE trabajo
(
  id_trabajo serial,
  trabajo_titulo varchar(120),
  trabajo_mension varchar(30),
  trabajo_fecha_presentacion date,
  trabajo_proceso varchar(50),
  trabajo_resumen varchar(300),
  trabajo_fecha_registro date,
  trabajo_estado_actual varchar(120),
  trabajo_fecha_de_cierre date,
  PRIMARY KEY (id_trabajo)
);


-- DROP TABLE usuario_trabajo;

CREATE TABLE usuario_trabajo
(
  id_usuario_trabajo serial,
  fk_usuario int,
  fk_trabajo int,
  vinculo varchar(60),
  fecha_de_asignacion date,
  PRIMARY KEY (id_usuario_trabajo),
  FOREIGN KEY (fk_trabajo)
      REFERENCES trabajo (id_trabajo) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (fk_usuario)
      REFERENCES usuario (id_usuario) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);


-- DROP TABLE fase;

CREATE TABLE fase
(
  id_fase serial,
  fase_nombre varchar(30),
  fase_descripcion varchar(130),
  fase_fecha_registro date,
  PRIMARY KEY (id_fase)
);


-- DROP TABLE trabajo_fase;

CREATE TABLE trabajo_fase
(
  id_trabajo_fase serial,
  fk_fase int,
  fk_trabajo int,
  trabajo_fase_fecha_registro date,
  PRIMARY KEY (id_trabajo_fase),
  FOREIGN KEY (fk_fase)
      REFERENCES fase (id_fase) MATCH FULL
      ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (fk_trabajo)
      REFERENCES trabajo (id_trabajo) MATCH FULL
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE linea;

CREATE TABLE linea
(
  id_linea serial,
  linea_nombre varchar(60),
  linea_descripcion varchar(300),
  linea_fecha_registro date,
  PRIMARY KEY (id_linea)
);



-- DROP TABLE trabajo_linea;

CREATE TABLE trabajo_linea
(
  id serial,
  fk_linea int,
  fk_trabajo int,
  trabajo_linea_fecha_registro date,
  PRIMARY KEY (id),
  FOREIGN KEY (fk_linea)
      REFERENCES linea (id_linea) MATCH FULL
      ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (fk_trabajo)
      REFERENCES trabajo (id_trabajo) MATCH FULL
      ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO categoria(categoria_nombre, categoria_descripcion, categoria_fecha_registro)VALUES ('sin categoria', 'sin ninguna categoria el usuario no es docente',NOW());

INSERT INTO usuario(usuario_cedula,usuario_nombre,usuario_apellido,usuario_sexo,usuario_telefono,usuario_correo,usuario_direccion,usuario_clave,usuario_fecha_registro,fk_categoria,fecha_asignacion_de_categoria,usuario_estado) VALUES('123456','autana','autana',2,0416876564,'sistemaautanauptaeb@gmail.com','lara',md5('autana'),NOW(),1,NOW(),1);
INSERT INTO rol(rol_nombre, rol_descripcion, rol_fecha_registro)VALUES ('administrador', 'control total del sistema',NOW());
INSERT INTO fase(fase_nombre, fase_descripcion,fase_fecha_registro)VALUES ('sin fase','sin asignar',NOW());
INSERT INTO fase(fase_nombre, fase_descripcion,fase_fecha_registro)VALUES ('Aprobación','Fase de aprobacion.. fase final del trabajo',NOW());
INSERT INTO linea(linea_nombre, linea_descripcion, linea_fecha_registro)VALUES ('sin linea','sin linea',NOW());
INSERT INTO departamento(departamento_nombre,departamento_descripcion,departamento_fecha_registro) VALUES('sin departamento','sin asignar',NOW());
INSERT INTO modulo(modulo_nombre,modulo_fecha_registro)VALUES ('iniciar sesion',NOW());
INSERT INTO modulo(modulo_nombre,modulo_fecha_registro)VALUES ('mis trabajos',NOW());
INSERT INTO modulo(modulo_nombre,modulo_fecha_registro)VALUES ('gestionar trabajos',NOW());
INSERT INTO modulo(modulo_nombre,modulo_fecha_registro)VALUES ('gestionar reportes',NOW());
INSERT INTO modulo(modulo_nombre,modulo_fecha_registro)VALUES ('gestion basica',NOW());
INSERT INTO modulo(modulo_nombre,modulo_fecha_registro)VALUES ('seguridad',NOW());
INSERT INTO modulo(modulo_nombre,modulo_fecha_registro)VALUES ('insertar datos',NOW());
INSERT INTO modulo(modulo_nombre,modulo_fecha_registro)VALUES ('listar datos',NOW());
INSERT INTO modulo(modulo_nombre,modulo_fecha_registro)VALUES ('editar datos',NOW());
INSERT INTO modulo(modulo_nombre,modulo_fecha_registro)VALUES ('eliminar datos',NOW());


INSERT INTO usuario_rol(fk_usuario, fk_rol, usuario_rol_fecha_registro)VALUES (1, 1, NOW());
INSERT INTO usuario_departamento(fk_usuario, fk_departamento)VALUES (1, 1);
INSERT INTO rol_modulo(fk_rol, fk_modulo, rol_modulo_fecha_registro) VALUES (1, 1, NOW());
INSERT INTO rol_modulo(fk_rol, fk_modulo, rol_modulo_fecha_registro) VALUES (1, 2, NOW());
INSERT INTO rol_modulo(fk_rol, fk_modulo, rol_modulo_fecha_registro) VALUES (1, 3, NOW());
INSERT INTO rol_modulo(fk_rol, fk_modulo, rol_modulo_fecha_registro) VALUES (1, 4, NOW());
INSERT INTO rol_modulo(fk_rol, fk_modulo, rol_modulo_fecha_registro) VALUES (1, 5, NOW());
INSERT INTO rol_modulo(fk_rol, fk_modulo, rol_modulo_fecha_registro) VALUES (1, 6, NOW());
INSERT INTO rol_modulo(fk_rol, fk_modulo, rol_modulo_fecha_registro) VALUES (1, 7, NOW());
INSERT INTO rol_modulo(fk_rol, fk_modulo, rol_modulo_fecha_registro) VALUES (1, 8, NOW());
INSERT INTO rol_modulo(fk_rol, fk_modulo, rol_modulo_fecha_registro) VALUES (1, 9, NOW());
INSERT INTO rol_modulo(fk_rol, fk_modulo, rol_modulo_fecha_registro) VALUES (1, 10, NOW());






CREATE TABLE bitacora
(
  id serial,
  tabla varchar(300),
  accion varchar(300),
  viejo varchar(300),
  nuevo varchar(300),
  fecha date,
  hora time,
  observacion varchar(300),
  PRIMARY KEY (id)
);

CREATE OR REPLACE FUNCTION auditar() RETURNS TRIGGER AS $$
  BEGIN
      IF (TG_OP = 'INSERT') THEN
          INSERT INTO bitacora(tabla,accion,nuevo,fecha,hora,observacion) values(TG_TABLE_NAME,'INSERTAR',NEW,NOW(),NOW(),'Se inserto un registro en la tabla exitosamente') ;
          RETURN NEW;
      ELSIF (TG_OP = 'UPDATE') THEN
          INSERT INTO bitacora(tabla,accion,viejo,nuevo,fecha,hora,observacion) values(TG_TABLE_NAME,'MODIFICAR',OLD,NEW,NOW(),NOW(),'Se modifico un registro en la tabla exitosamente') ;
          RETURN NEW;
      ELSIF (TG_OP = 'DELETE') THEN
          INSERT INTO bitacora(tabla,accion,viejo,fecha,hora,observacion) values(TG_TABLE_NAME,'ELIMINAR',OLD,NOW(),NOW(),'Se elimino un registro de la tabla exitosamente') ;
          RETURN OLD;
      END IF;
      RETURN NULL;
  END;
$$ LANGUAGE plpgsql;



CREATE TRIGGER auditar_insersion_trabajo
AFTER UPDATE OR DELETE OR INSERT ON trabajo
  FOR EACH ROW EXECUTE PROCEDURE auditar();

CREATE TRIGGER auditar_insersion_usuario
AFTER UPDATE OR DELETE OR INSERT ON usuario
  FOR EACH ROW EXECUTE PROCEDURE auditar();

CREATE TRIGGER auditar_insersion_fase
AFTER UPDATE OR DELETE OR INSERT ON fase
  FOR EACH ROW EXECUTE PROCEDURE auditar();

CREATE TRIGGER auditar_insersion_linea
AFTER UPDATE OR DELETE OR INSERT ON linea
  FOR EACH ROW EXECUTE PROCEDURE auditar();


CREATE TRIGGER auditar_insersion_departamento
AFTER UPDATE OR DELETE OR INSERT ON departamento
  FOR EACH ROW EXECUTE PROCEDURE auditar();

CREATE TRIGGER auditar_insersion_categoria
AFTER UPDATE OR DELETE OR INSERT ON categoria
  FOR EACH ROW EXECUTE PROCEDURE auditar();

CREATE TRIGGER auditar_insersion_rol
AFTER UPDATE OR DELETE OR INSERT ON rol
  FOR EACH ROW EXECUTE PROCEDURE auditar();

