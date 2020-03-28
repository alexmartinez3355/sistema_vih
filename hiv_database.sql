DROP DATABASE IF EXISTS hiv;
CREATE DATABASE hiv;
USE hiv;

-- TABLA USUARIOS ---------------------------------------------------------------------
CREATE TABLE usuarios(
	id_usuario INTEGER NOT NULL AUTO_INCREMENT,
    nombre_usuario TEXT NOT NULL,
    password_usuario TEXT NOT NULL,
    
    PRIMARY KEY (id_usuario)
);

-- TABLA DATOS_USUARIOS --------------------------------------------------------------------
CREATE TABLE datos_usuarios(
	id_datos_usuario INTEGER NOT NULL AUTO_INCREMENT,
    nombre TEXT(50) NOT NULL,
    apellido_p TEXT(50) NOT NULL,
    apellido_m TEXT(50) NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    edad INTEGER NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    curp VARCHAR(18) NOT NULL,
    email TEXT(100) NOT NULL,
    
    PRIMARY KEY (id_datos_usuario),
    
    id_usuario INTEGER NOT NULL,
	id_direccion INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA DIREECIONES -----------------------------------------------------------------------
CREATE TABLE direcciones(
	id_direccion INTEGER NOT NULL AUTO_INCREMENT,
    calle TEXT NOT NULL,
    numero TEXT NOT NULL,
    colonia TEXT NOT NULL,
    ciudad TEXT NOT NULL,
    codigo_postal TEXT NOT NULL,
    
    PRIMARY KEY (id_direccion)
);

-- TABLA MEDICOS ---------------------------------------------------------------------------
CREATE TABLE medicos(
	id_medico INTEGER NOT NULL AUTO_INCREMENT,
    cedula_profecional TEXT(10) NOT NULL,
    
    PRIMARY KEY (id_medico)
);

-- TABLA DE ROLES --------------------------------------------------------------------------
CREATE TABLE roles(
	id_rol INTEGER NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (id_rol)
);

-- TABLA USUARIOS_ROLES --------------------------------------------------------------------
CREATE TABLE usuarios_roles(
	id_usuario INTEGER NOT NULL,
    id_rol INTEGER NOT NULL
);

-- TABLA TELEFONOS -------------------------------------------------------------------------
CREATE TABLE telefonos(
	id_telefono INTEGER NOT NULL AUTO_INCREMENT,
    telefono INTEGER NOT NULL,
    
    PRIMARY KEY (id_telefono)
);

-- TABLA USUARIOS_TELEFONOS ---------------------------------------------------------------
CREATE TABLE usuarios_telefonos(
	id_usuario INTEGER NOT NULL,
    id_telefono INTEGER NOT NULL
);

-- TABLA PACIENTES ------------------------------------------------------------------------
CREATE TABLE pacientes(
	id_paciente INTEGER NOT NULL AUTO_INCREMENT,
    nss TEXT NOT NULL,
    ocupacion TEXT NOT NULL,
    
    PRIMARY KEY (id_paciente),
    
    id_usuario INTEGER NOT NULL
);

-- TABLA CLINICAS ------------------------------------------------------------------------
CREATE TABLE clinicas(
	id_clinica INTEGER NOT NULL AUTO_INCREMENT,
    nombre TEXT(100) NOT NULL,
    
    PRIMARY KEY (id_clinica),
    
    id_direccion INTEGER NOT NULL
);

-- TABLA CONSULTORIOS --------------------------------------------------------------------
CREATE TABLE consultorios(
	id_consultorio INTEGER NOT NULL AUTO_INCREMENT,
    numero_consultorio INTEGER NOT NULL,
    
    PRIMARY KEY (id_consultorio),
    
    id_clinica INTEGER NOT NULL
);

-- TABLA ESPECIALIDADES ------------------------------------------------------------------
CREATE TABLE especialidades(
	id_especialidad INTEGER NOT NULL AUTO_INCREMENT,
    descripcion TEXT(100) NOT NULL,
    
    PRIMARY KEY (id_especialidad)
);

-- TABLA ESPECIALIDAD_MEDICO -------------------------------------------------------------
CREATE TABLE especialidad_medicos (
	id_especialidad INTEGER NOT NULL,
    id_medico INTEGER NOT NULL
);

-- TABLA TELEFONOS_CONSULTORIOS ----------------------------------------------------------
CREATE TABLE telefonos_consultorios(
	id_telefono INTEGER NOT NULL,
    id_consultorio INTEGER NOT NULL
);

-- TABLA FAMILIARES ----------------------------------------------------------------------
CREATE TABLE familiares (
	id_familiar INTEGER NOT NULL AUTO_INCREMENT,
    parentesco VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (id_familiar)
);

-- TABLA ANTECEDENTES_FAMILIARES ---------------------------------------------------------
CREATE TABLE antecedentes_familiares (
	id_antecedentes_familiares INTEGER NOT NULL AUTO_INCREMENT,
    enfermedad_vascular_cerebral BOOLEAN,
    diabetes_melitus BOOLEAN,
    dislipedia BOOLEAN,
    enfermedad_renal_cronica BOOLEAN,
    infarto_agudo_miocardio BOOLEAN,
    hipertencion_arterial_sistemica BOOLEAN,
    cancer BOOLEAN,
    observaciones TEXT(150),
    
    PRIMARY KEY (id_antecedentes_familiares),
    
    id_familiar INTEGER NOT NULL,
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA ALERGIAS ------------------------------------------------------------------------
CREATE TABLE alergias (
	id_alergia INTEGER NOT NULL AUTO_INCREMENT,
    descripcion TEXT(50) NOT NULL,
    
    PRIMARY KEY (id_alergia),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA TRANSFUCIONES -------------------------------------------------------------------
CREATE TABLE transfuciones (
	id_transfucion INTEGER NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    
    PRIMARY KEY (id_transfucion),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA CIRUGIAS -----------------------------------------------------------------------
CREATE TABLE cirugias (
	id_cirugia INTEGER NOT NULL AUTO_INCREMENT,
    descripcion TEXT(100) NOT NULL,
    fecha DATE NOT NULL,
    
    PRIMARY KEY (id_cirugia),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA ANTECEDENTES_MEDICOS ------------------------------------------------------------
CREATE TABLE antecedentes_medicos (
	id_antecedente_medico INTEGER NOT NULL AUTO_INCREMENT,
    traumaticos TEXT(100) NOT NULL,
    observaciones TEXT(100) NOT NULL,
    diabetes BOOLEAN,
    fecha_deteccion_diabetes DATE,
    tratamiento_diabetes TEXT(150),
    
    PRIMARY KEY (id_antecedente_medico),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA ANTECEDENTES_NO_PATOLOGICOS
CREATE TABLE antecedentes_no_patologicos (
	id_antecedente_no_patologico INTEGER NOT NULL AUTO_INCREMENT,
    combe BOOLEAN,
    fecha_combe DATE,
    descripcion_combe TEXT(100),
    tabaquismo BOOLEAN,
    edad_inicio_tabaquismo INTEGER,
    edad_fin_tabaquismo INTEGER,
    cantidad_tabaquismo INTEGER,
    etilismo BOOLEAN,
    edad_inicio_etilismo INTEGER,
    edad_fin_etilismo INTEGER,
    cantidad_etilismo INTEGER,
    otras_drogas BOOLEAN,
    descripcion_otras_drogras TEXT(100),
    
    PRIMARY KEY (id_antecedente_no_patologico),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL,
    id_periodisidad_tabaquismo INTEGER NOT NULL,
    id_periodisidad_etilismo INTEGER NOT NULL
);

-- TABLA PERIODISIDAD ---------------------------------------------------------------------
CREATE TABLE periodisidad (
	id_periodisidad INTEGER NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(10) NOT NULL,
    
    PRIMARY KEY (id_periodisidad)
);

-- TABLA BIOMETRICA_GLUCOSA --------------------------------------------------------------
CREATE TABLE biometrica_glucosa (
	id_biometrica_glucosa INTEGER NOT NULL AUTO_INCREMENT,
    eritrocitos DECIMAL(10,3),
    hemoglobina DECIMAL(10,3),
    hematocrito DECIMAL(10,3),
    plaquetas DECIMAL(10,3),
    leucositos DECIMAL(10,3),
    glucosa DECIMAL(10,3),
    linfositos DECIMAL(10,3),
    observaciones TEXT(200),
    
    PRIMARY KEY (id_biometrica_glucosa),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA CITAS --------------------------------------------------------------------------
CREATE TABLE citas (
	id_cita INTEGER NOT NULL AUTO_INCREMENT,
    descripcion_cita TEXT(150) NOT NULL,
    fecha_cita DATE NOT NULL,
    diagnostico TEXT(150) NOT NULL,
    
    PRIMARY KEY (id_cita),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL,
    id_clinica_envia INTEGER NOT NULL,
    id_clinica_recive INTEGER NOT NULL
);

-- TABLA CITAS --------------------------------------------------------------------------
CREATE TABLE examenes_fisicos (
	id_examen_fisico INTEGER NOT NULL AUTO_INCREMENT,
    neurologico TEXT(50) NOT NULL,
    cardiovascular TEXT(50) NOT NULL,
    pulmones TEXT(50) NOT NULL,
	abdomen TEXT(50) NOT NULL,
    miembros TEXT(50) NOT NULL,
    piel_anexos TEXT(50) NOT NULL,
    genitales TEXT(50) NOT NULL,
    ganglios_linfaticos TEXT(50) NOT NULL,
    observaciones TEXT(150),
    
    PRIMARY KEY (id_examen_fisico),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA SINTOMAS_SIGNOS_VITALES ----------------------------------------------------------
CREATE TABLE sintomas_signos_vitales (
	id_sintoma_signo_vital INTEGER NOT NULL AUTO_INCREMENT,
    frecuencia_respiratoria DECIMAL(10,3) NOT NULL,
    presion_arterial_sistolica DECIMAL(10,3) NOT NULL,
    presion_arterial_diastolica DECIMAL(10,3) NOT NULL,
    temperatura DECIMAL(10,3) NOT NULL,
    estatura DECIMAL(3,3) NOT NULL,
    peso DECIMAL(4,3) NOT NULL,
    imc DECIMAL(10,3) NOT NULL,
    observaciones TEXT(150),
    
    PRIMARY KEY (id_sintoma_signo_vital),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA HISTORIAL_SEXUAL ----------------------------------------------------------------
CREATE TABLE historial_sexual (
	id_historial_sexual INTEGER NOT NULL AUTO_INCREMENT,
    edad_inicio_sexual INTEGER NOT NULL,
    numero_parejas INTEGER NOT NULL,
    genero_parejas VARCHAR(10) NOT NULL,
    serologia_pareja VARCHAR(10) NOT NULL,
    tratamiento_pareja TEXT(150),
    ets_its_anterior TEXT(150),
    observaciones TEXT(150),
    
    PRIMARY KEY (id_historial_sexual),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA EVOLUCION_VIRAL -----------------------------------------------------------------
CREATE TABLE evolucion_viral (
	id_evolucion_viral INTEGER NOT NULL AUTO_INCREMENT,
    tratamiento_tx_arv TEXT(100),
    fecha_inicio_trata_tx_arv DATE,
    carga_viral INTEGER,
    log_10 INTEGER,
    fecha_toma_log_10 DATE,
    celulas_milimetro_cubico INTEGER,
    porcentaje INTEGER,
    fecha_toma_cel_mili_cubi DATE,
    observaciones TEXT(150),
    
    PRIMARY KEY (id_evolucion_viral),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA PACIENTES_MEDICOS -----------------------------------------------------------------
CREATE TABLE pacientes_medicos (
	id_paciente INTEGER NOT NULL,
    id_medico INTEGER NOT NULL
);

-- TABLA PERFILES_LIPIDICOS ----------------------------------------------------------------
CREATE TABLE perfiles_lipidicos (
	id_perfil_lipidico INTEGER NOT NULL AUTO_INCREMENT,
    colesterol INTEGER NOT NULL,
    colesterol_alta_densidad INTEGER NOT NULL,
    colesterol_baja_densidad INTEGER NOT NULL,
    colesterol_muy_baja_densidad INTEGER NOT NULL,
    trigliceridos INTEGER NOT NULL,
    observaciones TEXT(150),
    
    PRIMARY KEY (id_perfil_lipidico),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA PERFIL_RENAL ----------------------------------------------------------------------
CREATE TABLE perfiles_renales (
	id_perfil_renal INTEGER NOT NULL AUTO_INCREMENT,
    urea DECIMAL(5,3) NOT NULL,
    nitrogeno_ureico DECIMAL(5,3) NOT NULL,
    creatinica DECIMAL(5,3) NOT NULL,
    acido_urico DECIMAL(5,3) NOT NULL,
    observaciones TEXT(150),
    
    PRIMARY KEY (id_perfil_renal),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA PERFILES_HEPATICOS ----------------------------------------------------------------
CREATE TABLE perfiles_hepaticos (
	id_perfil_hepatico INTEGER NOT NULL AUTO_INCREMENT,
    bilirrubina DECIMAL(5,3) NOT NULL,
    bilirrubina_directa DECIMAL(5,3) NOT NULL,
    bilirrubina_indirecta DECIMAL(5,3) NOT NULL,
    alaninoaminotransferasa DECIMAL(5,3) NOT NULL,
    aspartatoaminotransferasa DECIMAL(5,3) NOT NULL,
    fosfatasa_alcalina DECIMAL(5,3) NOT NULL,
    deshidrogenasa_lactica DECIMAL(5,3) NOT NULL,
    proteinas_totales DECIMAL(5,3) NOT NULL,
    albumina DECIMAL(5,3) NOT NULL,
    globulina DECIMAL(5,3) NOT NULL,
    albumina_globulina DECIMAL(5,3) NOT NULL,
    observaciones TEXT(150),
    
    PRIMARY KEY (id_perfil_hepatico),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA HEPATITIS_B -----------------------------------------------------------------------
CREATE TABLE hepatitis_b (
	id_hepatitis_b INTEGER NOT NULL AUTO_INCREMENT,
    antigeno_s BOOLEAN NOT NULL,
    antigeno_core BOOLEAN NOT NULL,
    antigeno_e BOOLEAN NOT NULL,
    acs_vs_ag_s BOOLEAN NOT NULL,
    acs_vs_ag_core BOOLEAN NOT NULL,
    acs_vs_ag_core_total BOOLEAN NOT NULL,
    acs_vs_ag_core_igm BOOLEAN NOT NULL,
    acs_vs_ag_c BOOLEAN NOT NULL,
    fecha_hepatitis_b DATE,
    observaciones_hepatitis_b TEXT(150),
    
    PRIMARY KEY (id_hepatitis_b),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA HEPATITIS_C -----------------------------------------------------------------------
CREATE TABLE hepatitis_c (
	id_hepatitis_c INTEGER NOT NULL AUTO_INCREMENT,
    serologia BOOLEAN NOT NULL,
    fecha_hepatitis_c DATE NOT NULL,
    observaciones_hepatitis_c TEXT(150),
    
    PRIMARY KEY (id_hepatitis_c),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA SIFILIS ---------------------------------------------------------------------------
CREATE TABLE sifilis (
	id_sifilis INTEGER NOT NULL AUTO_INCREMENT,
    serologia BOOLEAN NOT NULL,
    duracion_suero TEXT(150) NOT NULL,
    fecha_sifilis DATE NOT NULL,
    observaciones_sifilis TEXT(150),
    
    PRIMARY KEY (id_sifilis),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA VIH -------------------------------------------------------------------------------
CREATE TABLE vih (
	id_vih INTEGER NOT NULL AUTO_INCREMENT,
    serologia_elisa BOOLEAN NOT NULL,
    fecha_elisa DATE NOT NULL,
    serologia_western BOOLEAN NOT NULL,
    fecha_western DATE NOT NULL,
    observaciones_vih TEXT(150),
    
    PRIMARY KEY (id_vih),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA VACUNAS ---------------------------------------------------------------------------
CREATE TABLE vacunas (
	id_vacuna INTEGER NOT NULL AUTO_INCREMENT,
    nombre TEXT(100) NOT NULL,
    
    PRIMARY KEY (id_vacuna)
);

-- TABLA VACUNAS_PACIENTES -----------------------------------------------------------------
CREATE TABLE vacunas_pacientes (
	indicacion TEXT(150) NOT NULL,
    fecha_recomendada DATE NOT NULL,
    fecha_aplicacion DATE NOT NULL,
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA NOTIFICACIONES --------------------------------------------------------------------
CREATE TABLE notificaciones (
	id_notificacion INTEGER NOT NULL AUTO_INCREMENT,
    alerta VARCHAR(50) NOT NULL,
    descripcion_alerta TEXT(150) NOT NULL,
    respuesta_medico TEXT(150) NOT NULL,
    notificacion_leida BOOLEAN NOT NULL,
    notificacion_cancelada BOOLEAN NOT NULL,
    fecha_notificacion DATE NOT NULL,
    fecha_expiracion DATE,
    
    PRIMARY KEY (id_notificacion),
    
    id_paciente INTEGER NOT NULL,
    id_medico INTEGER NOT NULL
);

-- TABLA SALUD_SEXUAL ----------------------------------------------------------------------
CREATE TABLE salud_sexual (
	id_salud_sexual INTEGER NOT NULL AUTO_INCREMENT,
    cambio_pareja BOOLEAN NOT NULL,
    sexo_pareja_actual BOOLEAN NOT NULL,
    serologia_pareja_actual BOOLEAN NOT NULL,
    tratamiento_pareja_actual TEXT(150),
    uso_preservativo BOOLEAN NOT NULL, 
    ets_its TEXT(150),
    papanicolaou TEXT(150),
    mamografia TEXT(150),
    planeacion_familiar TEXT(150) NOT NULL,
    observaciones TEXT(150),
    
    PRIMARY KEY (id_salud_sexual),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- TABLA DIAGNOSTICO -----------------------------------------------------------------------
CREATE TABLE diagnostico (
	id_diagnostico INTEGER NOT NULL AUTO_INCREMENT,
    diagnostico_medico TEXT(150) NOT NULL,
    examenes_solicitados TEXT(150),
    receta_prescirpciones TEXT(150),
    
    PRIMARY KEY (id_diagnostico),
    
    id_paciente INTEGER NOT NULL,
    id_medico_registro INTEGER NOT NULL
);

-- FOREIGN KEYs DIAGNOSTICO --
ALTER TABLE diagnostico ADD CONSTRAINT fk_pacientes_to_diagnostico FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE diagnostico ADD CONSTRAINT fk_medicos_to_diagnostico FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs SALUD SEXUAL --
ALTER TABLE salud_sexual ADD CONSTRAINT fk_pacientes_to_salud_sexual FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE salud_sexual ADD CONSTRAINT fk_medicos_to_salud_sexual FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIG KEYs NOTIFICACIONES --
ALTER TABLE notificaciones ADD CONSTRAINT fk_pacientes_to_notificaciones FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE notificaciones ADD CONSTRAINT fk_medicos_to_notificaciones FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs VACUNAS_PACIENTES --
ALTER TABLE vacunas_pacientes ADD CONSTRAINT fk_pacientes_to_vacunas_pacientes FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE vacunas_pacientes ADD CONSTRAINT fk_medicos_to_vacunas_pacientes FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs VIH --
ALTER TABLE vih ADD CONSTRAINT fk_paciente_to_vih FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE vih ADD CONSTRAINT fk_medicos_to_vih FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs SIFILIS --
ALTER TABLE sifilis ADD CONSTRAINT fk_pacientes_to_sifilis FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE sifilis ADD CONSTRAINT fk_medicos_to_sifilis FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs HEPATITIS_C --
ALTER TABLE hepatitis_c ADD CONSTRAINT fk_pacientes_to_hepatitis_c FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE hepatitis_c ADD CONSTRAINT fk_medicos_to_hepatitis_c FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs HEPATITIS_B --
ALTER TABLE hepatitis_b ADD CONSTRAINT fk_pacientes_to_hepatitis_b FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE hepatitis_b ADD CONSTRAINT fk_medicos_to_hepatitis_b FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs PERFILES_HEPATICOS --
ALTER TABLE perfiles_hepaticos ADD CONSTRAINT fk_pacientes_to_perfiles_hepaticos FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE perfiles_hepaticos ADD CONSTRAINT fk_medicos_to_perfiles_hepaticos FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs PERFILES_RENALES --
ALTER TABLE perfiles_renales ADD CONSTRAINT fk_pacientes_to_perfiles_renales FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE perfiles_renales ADD CONSTRAINT fk_medicos_to_perfiles_renales FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs PERFILES_LIPIDICOS --
ALTER TABLE perfiles_lipidicos ADD CONSTRAINT fk_pacientes_to_perfiles_lipidicos FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE perfiles_lipidicos ADD CONSTRAINT fk_medicos_to_perfiles_lipidicos FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs EVOLUCION_VIRAL --
ALTER TABLE pacientes_medicos ADD CONSTRAINT fk_pacientes_to_pacientes_medicos FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pacientes_medicos ADD CONSTRAINT fk_medicos_to_pacientes_medicos FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs EVOLUCION_VIRAL --
ALTER TABLE evolucion_viral ADD CONSTRAINT fk_pacientes_to_evolucion_viral FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE evolucion_viral ADD CONSTRAINT fk_medicos_to_evolucion_viral FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs HISTORIAL_SEXUAL --
ALTER TABLE historial_sexual ADD CONSTRAINT fk_pacientes_to_historial_sex FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE historial_sexual ADD CONSTRAINT fk_medicos_to_historial_sex FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs SINTOMAS_SIGNOS_VITALES --
ALTER TABLE sintomas_signos_vitales ADD CONSTRAINT fk_pacientes_to_ss_vitales FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE sintomas_signos_vitales ADD CONSTRAINT fk_medicos_to_ss_vitales FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs EXAMENES_FISICOS --
ALTER TABLE examenes_fisicos ADD CONSTRAINT fk_pacientes_to_examenes_fisicos FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE examenes_fisicos ADD CONSTRAINT fk_medicos_to_examenes_fisicos FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FORIGN KEYs CITAS --
ALTER TABLE citas ADD CONSTRAINT fk_pacientes_to_citas FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE citas ADD CONSTRAINT fk_medicos_to_citas FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE citas ADD CONSTRAINT fk_clinica_envia_to_citas FOREIGN KEY (id_clinica_envia) REFERENCES clinicas(id_clinica) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE citas ADD CONSTRAINT fk_clinica_revice_to_clitas FOREIGN KEY (id_clinica_recive) REFERENCES clinicas(id_clinica) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs BIOMETRICA_GLUCOSA --
ALTER TABLE biometrica_glucosa ADD CONSTRAINT fk_pacientes_to_bio_glucosa FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE biometrica_glucosa ADD CONSTRAINT fk_medicos_to_bio_glucosa FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;
    
-- FOREIGN KEYs ANTECEDENTES_NO_PATOLOGICOS --
ALTER TABLE antecedentes_no_patologicos ADD CONSTRAINT fk_paciente_to_ant_no_patologicos FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE antecedentes_no_patologicos ADD CONSTRAINT fk_medicos_to_ant_no_patologicos	FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE antecedentes_no_patologicos ADD CONSTRAINT fk_periodi_tabaquismo_to_ant_no_pato FOREIGN KEY (id_periodisidad_tabaquismo) REFERENCES periodisidad(id_periodisidad) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE antecedentes_no_patologicos ADD CONSTRAINT fk_periodi_etilismo_to_ant_no_pato FOREIGN KEY (id_periodisidad_etilismo) REFERENCES periodisidad(id_periodisidad) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs ANTECEDENTES_MEDICOS --
ALTER TABLE antecedentes_medicos ADD CONSTRAINT fk_pacientes_to_antecedentes_medicos FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE antecedentes_medicos ADD CONSTRAINT fk_medicos_to_antecedentes_medicos FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs CIRUGIAS --
ALTER TABLE cirugias ADD CONSTRAINT fk_pacientes_to_cirugias FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE cirugias ADD CONSTRAINT fk_medicos_to_cirugias FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs TRANSFUCIONES --
ALTER TABLE transfuciones ADD CONSTRAINT fk_pacientes_to_transfuciones FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE transfuciones ADD CONSTRAINT fk_medicos_to_transfuciones FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs ALERGIAS --
ALTER TABLE alergias ADD CONSTRAINT fk_pacientes_to_alergias FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE alergias ADD CONSTRAINT fk_medicos_to_alergias FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs ANTECEDENTES_FAMILIARES --
ALTER TABLE antecedentes_familiares ADD CONSTRAINT fk_familiares_to_antecedentes_familiares FOREIGN KEY (id_familiar) REFERENCES familiares(id_familiar) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE antecedentes_familiares ADD CONSTRAINT fk_pacientes_to_antecedentes_familiares FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE antecedentes_familiares ADD CONSTRAINT fk_medicos_to_antecedentes_familiares FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs TELEFONOS_CONSULTORIOS --
ALTER TABLE telefonos_consultorios ADD CONSTRAINT fk_telefonos_to_telefonos_consultorios FOREIGN KEY (id_telefono) REFERENCES telefonos(id_telefono) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE telefonos_consultorios ADD CONSTRAINT fk_consultorios_to_telefonos_consultorios FOREIGN KEY (id_consultorio) REFERENCES consultorios(id_consultorio) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs ESPECIALIDAD_MEDICOS --
ALTER TABLE especialidad_medicos ADD CONSTRAINT fk_medico_to_especialidad_medicos FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE especialidad_medicos ADD CONSTRAINT fk_especialidad_to_especialidad_medicos FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs CONSULTORIOS --
ALTER TABLE consultorios ADD CONSTRAINT fk_clinicas_to_consultorios FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs CLINICAS --
ALTER TABLE clinicas ADD CONSTRAINT fk_direeciones_to_clinicas FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs PACIENTES --
ALTER TABLE pacientes ADD CONSTRAINT fk_usuarios_to_pacientes FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs USUARIOS_TELEFONOS --
ALTER TABLE usuarios_telefonos ADD CONSTRAINT fk_usuarios_to_usuarios_telefonos FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE usuarios_telefonos ADD CONSTRAINT fk_telefonos_to_usuarios_telefonos FOREIGN KEY (id_telefono) REFERENCES telefonos(id_telefono) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs USUARIOS_ROLES --
ALTER TABLE usuarios_roles ADD CONSTRAINT fk_usuarios_to_usuarios_roles FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE usuarios_roles ADD CONSTRAINT fk_roles_to_usuarios_roles FOREIGN KEY (id_rol) REFERENCES roles(id_rol) ON DELETE CASCADE ON UPDATE CASCADE;

-- FOREIGN KEYs DATOS_USUARIOS --
ALTER TABLE datos_usuarios ADD CONSTRAINT fk_usuarios_to_datos_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE datos_usuarios ADD CONSTRAINT fk_medicos_to_datos_usuarios FOREIGN KEY (id_medico_registro) REFERENCES medicos(id_medico) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE datos_usuarios ADD CONSTRAINT fk_direcciones_to_datos_usuarios FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion) ON DELETE CASCADE ON UPDATE CASCADE;