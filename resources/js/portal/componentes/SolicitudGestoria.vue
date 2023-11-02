<template>
    <div class="col-md-12 p-0 contenedor_forms">
        <div class="card bg-secundario2">
            <div class="card-body pb-0">
                <div class="row">
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.nombres,
                            }"
                            >Nombre completo*:</label
                        >
                        <input
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.nombres,
                            }"
                            v-model="oGestoriaSolicitud.nombres"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.nombres"
                            v-text="errors.nombres[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.apellidos,
                            }"
                            >Apellido completo*:</label
                        >
                        <input
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.apellidos,
                            }"
                            v-model="oGestoriaSolicitud.apellidos"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.apellidos"
                            v-text="errors.apellidos[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.fecha_nac,
                            }"
                            >Fecha de nacimiento*:</label
                        >
                        <input
                            type="date"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.fecha_nac,
                            }"
                            v-model="oGestoriaSolicitud.fecha_nac"
                            @change="calculaEdad"
                            @keyup="calculaEdad"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.fecha_nac"
                            v-text="errors.fecha_nac[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.edad,
                            }"
                            >Edad*:</label
                        >
                        <input
                            type="number"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.edad,
                            }"
                            v-model="oGestoriaSolicitud.edad"
                            readonly
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.edad"
                            v-text="errors.edad[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.nacionalidad,
                            }"
                            >Nacionalidad*:</label
                        >
                        <input
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.nacionalidad,
                            }"
                            v-model="oGestoriaSolicitud.nacionalidad"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.nacionalidad"
                            v-text="errors.nacionalidad[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.estado,
                            }"
                            >Estado:</label
                        >
                        <input
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.estado,
                            }"
                            v-model="oGestoriaSolicitud.estado"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.estado"
                            v-text="errors.estado[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.sexo,
                            }"
                            >Sexo*:</label
                        >
                        <select
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.sexo,
                            }"
                            v-model="oGestoriaSolicitud.sexo"
                        >
                            <option value="">- Seleccione -</option>
                            <option value="HOMBRE">HOMBRE</option>
                            <option value="MUJER">MUJER</option>
                        </select>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.sexo"
                            v-text="errors.sexo[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.fono,
                            }"
                            >Celular*:</label
                        >
                        <input
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.fono,
                            }"
                            v-model="oGestoriaSolicitud.fono"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.fono"
                            v-text="errors.fono[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.familiares_eeuu,
                            }"
                            >¿Tiene familiares en Estados Unidos?*:</label
                        >
                        <select
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.familiares_eeuu,
                            }"
                            v-model="oGestoriaSolicitud.familiares_eeuu"
                        >
                            <option value="">- Seleccione -</option>
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.familiares_eeuu"
                            v-text="errors.familiares_eeuu[0]"
                        ></span>
                    </div>
                    <div
                        class="form-group col-md-4"
                        v-if="oGestoriaSolicitud.familiares_eeuu == 'SI'"
                    >
                        <label
                            :class="{
                                'text-danger': errors.parentesco,
                            }"
                            >¿Cuál es el parentesco familiar?*:</label
                        >
                        <input
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.parentesco,
                            }"
                            v-model="oGestoriaSolicitud.parentesco"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.parentesco"
                            v-text="errors.parentesco[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.familiar_deportado,
                            }"
                            >¿Algún familiar fue deportado de Estados
                            Unidos?*:</label
                        >
                        <select
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.familiar_deportado,
                            }"
                            v-model="oGestoriaSolicitud.familiar_deportado"
                        >
                            <option value="">- Seleccione -</option>
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.familiar_deportado"
                            v-text="errors.familiar_deportado[0]"
                        ></span>
                    </div>
                    <div
                        class="form-group col-md-4"
                        v-if="oGestoriaSolicitud.familiar_deportado == 'SI'"
                    >
                        <label
                            :class="{
                                'text-danger': errors.motivo,
                            }"
                            >¿Cuál fue el motivo?*:</label
                        >
                        <input
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.motivo,
                            }"
                            v-model="oGestoriaSolicitud.motivo"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.motivo"
                            v-text="errors.motivo[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.deportado_otro_pais,
                            }"
                            >¿Fue deportado de algún otro país?*:</label
                        >
                        <select
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.deportado_otro_pais,
                            }"
                            v-model="oGestoriaSolicitud.deportado_otro_pais"
                        >
                            <option value="">- Seleccione -</option>
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.deportado_otro_pais"
                            v-text="errors.deportado_otro_pais[0]"
                        ></span>
                    </div>
                    <div
                        class="form-group col-md-4"
                        v-if="oGestoriaSolicitud.deportado_otro_pais == 'SI'"
                    >
                        <label
                            :class="{
                                'text-danger': errors.motivo_otro_pais,
                            }"
                            >¿Cuál fue el motivo?*:</label
                        >
                        <input
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.motivo_otro_pais,
                            }"
                            v-model="oGestoriaSolicitud.motivo_otro_pais"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.motivo_otro_pais"
                            v-text="errors.motivo_otro_pais[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.antecedentes_penales,
                            }"
                            >¿Tiene antecedentes penales?*:</label
                        >
                        <select
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.antecedentes_penales,
                            }"
                            v-model="oGestoriaSolicitud.antecedentes_penales"
                        >
                            <option value="">- Seleccione -</option>
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                            <option value="OTRO">OTRO</option>
                        </select>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.antecedentes_penales"
                            v-text="errors.antecedentes_penales[0]"
                        ></span>
                    </div>
                    <div
                        class="form-group col-md-4"
                        v-if="oGestoriaSolicitud.antecedentes_penales == 'OTRO'"
                    >
                        <label
                            :class="{
                                'text-danger': errors.desc_antecedentes,
                            }"
                            >Describir*:</label
                        >
                        <el-input
                            type="textarea"
                            class="w-full"
                            :class="{
                                'is-invalid': errors.desc_antecedentes,
                            }"
                            v-model="oGestoriaSolicitud.desc_antecedentes"
                            autosize
                        ></el-input>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.desc_antecedentes"
                            v-text="errors.desc_antecedentes[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.estudios,
                            }"
                            >Estudios*:</label
                        >
                        <el-input
                            type="textarea"
                            :class="{
                                'is-invalid': errors.estudios,
                            }"
                            v-model="oGestoriaSolicitud.estudios"
                            autosize
                            placeholder="Ejemplo:
Lic. en Economía
Diseño grafico
Ing. en Sistemas
etc."
                        ></el-input>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.estudios"
                            v-text="errors.estudios[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.trabajo_actual,
                            }"
                            >Actualmente en que trabaja*:</label
                        >
                        <el-input
                            type="textarea"
                            class="w-full"
                            :class="{
                                'is-invalid': errors.trabajo_actual,
                            }"
                            v-model="oGestoriaSolicitud.trabajo_actual"
                            autosize
                        ></el-input>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.trabajo_actual"
                            v-text="errors.trabajo_actual[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.solicito_visa,
                            }"
                            >¿Alguna vez solicitó la visa de Estados
                            Unidos?*:</label
                        >
                        <select
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.solicito_visa,
                            }"
                            v-model="oGestoriaSolicitud.solicito_visa"
                        >
                            <option value="">- Seleccione -</option>
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.solicito_visa"
                            v-text="errors.solicito_visa[0]"
                        ></span>
                    </div>
                    <div
                        class="form-group col-md-4"
                        v-if="oGestoriaSolicitud.solicito_visa == 'SI'"
                    >
                        <label
                            :class="{
                                'text-danger': errors.motivo_rechazo,
                            }"
                            >¿Por qué lo rechazarón?*:</label
                        >
                        <el-input
                            type="textarea"
                            class="w-full"
                            :class="{
                                'is-invalid': errors.motivo_rechazo,
                            }"
                            v-model="oGestoriaSolicitud.motivo_rechazo"
                            autosize
                        ></el-input>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.motivo_rechazo"
                            v-text="errors.motivo_rechazo[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.cuenta_bancaria,
                            }"
                            >¿Tiene cuenta bancaria?*:</label
                        >
                        <select
                            type="text"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.cuenta_bancaria,
                            }"
                            v-model="oGestoriaSolicitud.cuenta_bancaria"
                        >
                            <option value="">- Seleccione -</option>
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.cuenta_bancaria"
                            v-text="errors.cuenta_bancaria[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.gana_aproximadamente,
                            }"
                            >¿Cuantó gana aproximadamente?*:</label
                        >
                        <input
                            type="number"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.gana_aproximadamente,
                            }"
                            v-model="oGestoriaSolicitud.gana_aproximadamente"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.gana_aproximadamente"
                            v-text="errors.gana_aproximadamente[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.redes_sociales,
                            }"
                            >Redes sociales*:</label
                        >
                        <el-input
                            type="textarea"
                            :class="{
                                'is-invalid': errors.redes_sociales,
                            }"
                            v-model="oGestoriaSolicitud.redes_sociales"
                            autosize
                            placeholder="Ejemplo:
https://www.facebook.com
https://www.instagram.com
https://twitter.com
etc."
                        ></el-input>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.redes_sociales"
                            v-text="errors.redes_sociales[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.correo,
                            }"
                            >Email*:</label
                        >
                        <input
                            type="email"
                            class="form-control w-full"
                            :class="{
                                'is-invalid': errors.correo,
                            }"
                            v-model="oGestoriaSolicitud.correo"
                        />
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.correo"
                            v-text="errors.correo[0]"
                        ></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label
                            :class="{
                                'text-danger': errors.recomendado_por,
                            }"
                            >¿Quién le recomendo nuestro servicio de Gestoría de
                            Visa?*:</label
                        >
                        <el-input
                            type="textarea"
                            :class="{
                                'is-invalid': errors.recomendado_por,
                            }"
                            v-model="oGestoriaSolicitud.recomendado_por"
                            autosize
                            placeholder="Ejemplo:
Lo vi en facebook
Un amigo/familiar me lo recomendo
etc."
                        ></el-input>
                        <span
                            class="error invalid-feedback d-block"
                            v-if="errors.recomendado_por"
                            v-text="errors.recomendado_por[0]"
                        ></span>
                    </div>
                    <div class="col-md-12" v-if="mensaje_servicio">
                        <p
                            class="w-100 text-center font-weight-bold mb-1"
                            v-text="mensaje_servicio"
                        ></p>
                    </div>
                </div>
            </div>
            <div class="card-footer pt-0">
                <div class="row">
                    <div class="col-md-12">
                        <button
                            class="btn btn-success btn-block btn-flat"
                            @click="registrarSolicitud"
                            :disabled="enviando"
                            v-html="txtBtnEnviar"
                        ></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: ["mensaje_servicio"],
    data() {
        return {
            oGestoriaSolicitud: {
                nombres: "",
                apellidos: "",
                fecha_nac: "",
                edad: "",
                nacionalidad: "",
                estado: "",
                sexo: "",
                fono: "",
                familiares_eeuu: "",
                parentesco: "",
                familiar_deportado: "",
                motivo: "",
                deportado_otro_pais: "",
                motivo_otro_pais: "",
                antecedentes_penales: "",
                desc_antecedentes: "",
                estudios: "",
                trabajo_actual: "",
                solicito_visa: "",
                motivo_rechazo: "",
                cuenta_bancaria: "",
                gana_aproximadamente: "",
                redes_sociales: "",
                correo: "",
                recomendado_por: "",
                estado_solicitud: "",
            },
            errors: [],
            enviando: false,
        };
    },
    computed: {
        txtBtnEnviar() {
            if (this.enviando) {
                return `Enviando <i class="fa fa-spinner fa-spin"></i>`;
            }
            return `Enviar solicitud <span class="fa fa-paper-plane"></span>`;
        },
    },
    mounted() {},
    methods: {
        registrarSolicitud() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/portal/registrar_solicitud";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                if (this.oGestoriaSolicitud.nombres)
                    formdata.append("nombres", this.oGestoriaSolicitud.nombres);

                if (this.oGestoriaSolicitud.apellidos)
                    formdata.append(
                        "apellidos",
                        this.oGestoriaSolicitud.apellidos
                    );
                if (this.oGestoriaSolicitud.fecha_nac)
                    formdata.append(
                        "fecha_nac",
                        this.oGestoriaSolicitud.fecha_nac
                    );
                if (this.oGestoriaSolicitud.edad)
                    formdata.append("edad", this.oGestoriaSolicitud.edad);
                if (this.oGestoriaSolicitud.nacionalidad)
                    formdata.append(
                        "nacionalidad",
                        this.oGestoriaSolicitud.nacionalidad
                    );
                if (this.oGestoriaSolicitud.estado)
                    formdata.append("estado", this.oGestoriaSolicitud.estado);
                if (this.oGestoriaSolicitud.sexo)
                    formdata.append("sexo", this.oGestoriaSolicitud.sexo);
                if (this.oGestoriaSolicitud.fono)
                    formdata.append("fono", this.oGestoriaSolicitud.fono);
                if (this.oGestoriaSolicitud.familiares_eeuu)
                    formdata.append(
                        "familiares_eeuu",
                        this.oGestoriaSolicitud.familiares_eeuu
                    );
                if (this.oGestoriaSolicitud.parentesco)
                    formdata.append(
                        "parentesco",
                        this.oGestoriaSolicitud.parentesco
                    );
                if (this.oGestoriaSolicitud.familiar_deportado)
                    formdata.append(
                        "familiar_deportado",
                        this.oGestoriaSolicitud.familiar_deportado
                    );
                if (this.oGestoriaSolicitud.motivo)
                    formdata.append("motivo", this.oGestoriaSolicitud.motivo);
                if (this.oGestoriaSolicitud.deportado_otro_pais)
                    formdata.append(
                        "deportado_otro_pais",
                        this.oGestoriaSolicitud.deportado_otro_pais
                    );
                if (this.oGestoriaSolicitud.motivo_otro_pais)
                    formdata.append(
                        "motivo_otro_pais",
                        this.oGestoriaSolicitud.motivo_otro_pais
                    );
                if (this.oGestoriaSolicitud.antecedentes_penales)
                    formdata.append(
                        "antecedentes_penales",
                        this.oGestoriaSolicitud.antecedentes_penales
                    );
                if (this.oGestoriaSolicitud.desc_antecedentes)
                    formdata.append(
                        "desc_antecedentes",
                        this.oGestoriaSolicitud.desc_antecedentes
                    );
                if (this.oGestoriaSolicitud.estudios)
                    formdata.append(
                        "estudios",
                        this.oGestoriaSolicitud.estudios
                    );
                if (this.oGestoriaSolicitud.trabajo_actual)
                    formdata.append(
                        "trabajo_actual",
                        this.oGestoriaSolicitud.trabajo_actual
                    );
                if (this.oGestoriaSolicitud.solicito_visa)
                    formdata.append(
                        "solicito_visa",
                        this.oGestoriaSolicitud.solicito_visa
                    );
                if (this.oGestoriaSolicitud.motivo_rechazo)
                    formdata.append(
                        "motivo_rechazo",
                        this.oGestoriaSolicitud.motivo_rechazo
                    );
                if (this.oGestoriaSolicitud.cuenta_bancaria)
                    formdata.append(
                        "cuenta_bancaria",
                        this.oGestoriaSolicitud.cuenta_bancaria
                    );
                if (this.oGestoriaSolicitud.gana_aproximadamente)
                    formdata.append(
                        "gana_aproximadamente",
                        this.oGestoriaSolicitud.gana_aproximadamente
                    );
                if (this.oGestoriaSolicitud.redes_sociales)
                    formdata.append(
                        "redes_sociales",
                        this.oGestoriaSolicitud.redes_sociales
                    );
                if (this.oGestoriaSolicitud.correo)
                    formdata.append("correo", this.oGestoriaSolicitud.correo);
                if (this.oGestoriaSolicitud.recomendado_por)
                    formdata.append(
                        "recomendado_por",
                        this.oGestoriaSolicitud.recomendado_por
                    );
                axios
                    .post(url, formdata, config)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: true,
                            confirmButtonColor: "#009688",
                            confirmButtonText: "Aceptar",
                        });
                        this.errors = [];
                        this.limpiarGestoriaSolicitud();
                        this.enviando = false;
                    })
                    .catch((error) => {
                        this.enviando = false;
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                                let mensaje = `<ul class="text-center">`;
                                for (let key in this.errors) {
                                    if (this.errors.hasOwnProperty(key)) {
                                        const value = this.errors[key];
                                        if (Array.isArray(value)) {
                                            value.forEach((error) => {
                                                mensaje += `<li><span>${error.trim()}</span></li>`;
                                            });
                                        }
                                    }
                                }
                                mensaje += `<ul/>`;
                                Swal.fire({
                                    icon: "error",
                                    title: "Tienes los siguientes errores en el formulario",
                                    html: mensaje,
                                    showConfirmButton: true,
                                    confirmButtonColor: "#009688",
                                    confirmButtonText: "Aceptar",
                                });
                            }
                            if (
                                error.response.status === 420 ||
                                error.response.status === 419 ||
                                error.response.status === 401
                            ) {
                                window.location = "/";
                            }
                            if (error.response.status === 500) {
                                Swal.fire({
                                    icon: "error",
                                    title: "Error",
                                    html: error.response.data.message,
                                    showConfirmButton: true,
                                    confirmButtonColor: "#009688",
                                    confirmButtonText: "Aceptar",
                                });
                            }
                        }
                    });
            } catch (e) {
                this.enviando = false;
                console.log(e);
            }
        },
        limpiarGestoriaSolicitud() {
            this.oGestoriaSolicitud = {
                nombres: "",
                apellidos: "",
                fecha_nac: "",
                edad: "",
                nacionalidad: "",
                estado: "",
                sexo: "",
                fono: "",
                familiares_eeuu: "",
                parentesco: "",
                familiar_deportado: "",
                motivo: "",
                deportado_otro_pais: "",
                motivo_otro_pais: "",
                antecedentes_penales: "",
                desc_antecedentes: "",
                estudios: "",
                trabajo_actual: "",
                solicito_visa: "",
                motivo_rechazo: "",
                cuenta_bancaria: "",
                gana_aproximadamente: "",
                redes_sociales: "",
                correo: "",
                recomendado_por: "",
                estado_solicitud: "",
            };
        },
        calculaEdad() {
            if (this.oGestoriaSolicitud.fecha_nac) {
                const fechaNac = new Date(this.oGestoriaSolicitud.fecha_nac);
                // Obtenemos la fecha actual
                const fechaActual = new Date();

                // Calculamos la diferencia en milisegundos
                const diferencia = fechaActual - fechaNac;

                // Convertimos la diferencia en años
                const edad = Math.floor(
                    diferencia / (1000 * 60 * 60 * 24 * 365.25)
                );
                this.oGestoriaSolicitud.edad = edad;
            } else {
                this.oGestoriaSolicitud.edad = "";
            }
        },
    },
};
</script>
<style></style>
