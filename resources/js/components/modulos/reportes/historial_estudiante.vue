<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Reportes - Historial de Estudiante</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="ml-auto mr-auto col-md-5">
                                    <form>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label
                                                    :class="{
                                                        'text-danger':
                                                            errors.estudiante_id,
                                                    }"
                                                    >Seleccionar
                                                    estudiante*</label
                                                >
                                                <el-select
                                                    v-model="
                                                        oReporte.estudiante_id
                                                    "
                                                    filterable
                                                    placeholder="Seleccione"
                                                    class="d-block"
                                                    :class="{
                                                        'is-invalid':
                                                            errors.estudiante_id,
                                                    }"
                                                    filterable
                                                >
                                                    <el-option
                                                        v-for="item in listEstudiantes"
                                                        :key="item.id"
                                                        :value="item.id"
                                                        :label="
                                                            item.full_name +
                                                            ' - ' +
                                                            item.correo
                                                        "
                                                    >
                                                    </el-option>
                                                </el-select>
                                                <span
                                                    class="error invalid-feedback"
                                                    v-if="errors.estudiante_id"
                                                    v-text="
                                                        errors.estudiante_id[0]
                                                    "
                                                ></span>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <el-button
                                                type="success"
                                                class="bg-success w-full"
                                                :loading="enviando"
                                                @click="generaReporte()"
                                                v-html="textoBtnPdf"
                                            ></el-button>
                                        </div>
                                        <div class="col-md-12 mt-1">
                                            <el-button
                                                type="success"
                                                class="bg-success w-full"
                                                :loading="enviando"
                                                @click="generaReporteExcel()"
                                                v-html="textoBtnExcel"
                                            ></el-button>
                                        </div>
                                        <div class="col-md-12">
                                            <el-button
                                                type="default"
                                                class="w-full mt-1"
                                                @click="limpiarFormulario()"
                                                >Reiniciar</el-button
                                            >
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    data() {
        return {
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            errors: [],
            oReporte: {
                estudiante_id: "",
            },
            aFechas: [],
            enviando: false,
            listEstudiantes: [],
            errors: [],
        };
    },
    computed: {
        textoBtnPdf() {
            if (this.enviando) {
                return `Generando... <i class="fa fa-spinner fa-spin"></i>`;
            }
            return `Generar Reporte PDF <i class="fa fa-file-pdf"></i>`;
        },
        textoBtnExcel() {
            if (this.enviando) {
                return `Generando... <i class="fa fa-spinner fa-spin"></i>`;
            }
            return `Generar Reporte EXCEL <i class="fa fa-file-excel"></i>`;
        },
    },
    mounted() {
        this.loadingWindow.close();
        this.getEstudiantes();
    },
    methods: {
        getEstudiantes() {
            axios.get(main_url + "/admin/inscripcions").then((response) => {
                this.listEstudiantes = response.data.inscripcions;
            });
        },
        limpiarFormulario() {
            this.oReporte.filtro = "Todos";
        },
        generaReporte() {
            this.enviando = true;
            let config = {
                responseType: "blob",
            };
            axios
                .post(
                    main_url + "/admin/reportes/historial_estudiante",
                    this.oReporte,
                    config
                )
                .then((res) => {
                    this.errors = [];
                    this.enviando = false;
                    let pdfBlob = new Blob([res.data], {
                        type: "application/pdf",
                    });
                    let urlReporte = URL.createObjectURL(pdfBlob);
                    window.open(urlReporte);
                })
                .catch(async (error) => {
                    let responseObj = await error.response.data.text();
                    responseObj = JSON.parse(responseObj);
                    console.log(error);
                    this.enviando = false;
                    if (error.response) {
                        if (error.response.status === 422) {
                            this.errors = responseObj.errors;
                        }
                        if (
                            error.response.status === 420 ||
                            error.response.status === 419 ||
                            error.response.status === 401
                        ) {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                html: responseObj.message,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                            window.location = "/";
                        }
                    }
                });
        },
        generaReporteExcel() {
            this.enviando = true;
            let config = {
                responseType: "blob",
            };
            axios
                .post(
                    "/admin/reportes/historial_estudiante_excel",
                    this.oReporte,
                    config
                )
                .then((response) => {
                    var fileURL = window.URL.createObjectURL(
                        new Blob([response.data])
                    );
                    var fileLink = document.createElement("a");
                    fileLink.href = fileURL;
                    fileLink.setAttribute(
                        "download",
                        "historial_estudiante.xlsx"
                    );
                    document.body.appendChild(fileLink);
                    this.enviando = false;
                    fileLink.click();
                    this.descargando = false;
                })
                .catch(async (error) => {
                    let responseObj = await error.response.data.text();
                    responseObj = JSON.parse(responseObj);
                    console.log(error);
                    this.enviando = false;
                    if (error.response) {
                        if (error.response.status === 422) {
                            this.errors = responseObj.errors;
                        }
                        if (
                            error.response.status === 420 ||
                            error.response.status === 419 ||
                            error.response.status === 401
                        ) {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                html: responseObj.message,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                            window.location = "/";
                        }
                    }
                });
        },
        obtieneFechas() {
            this.oReporte.fecha_ini = this.aFechas[0];
            this.oReporte.fecha_fin = this.aFechas[1];
        },
    },
};
</script>

<style></style>
