<template>
    <div class="content-wrapper contenedor_gestoria_solicituds">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>
                            Administración Gestoría de Visa > Solicitudes de
                            Servicios
                        </h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-3">
                                        <button
                                            v-if="
                                                permisos.includes(
                                                    'gestoria_solicituds.create'
                                                )
                                            "
                                            class="btn btn-success btn-flat btn-block"
                                            @click="
                                                abreModal('nuevo');
                                                limpiaGestoriaSolicitud();
                                            "
                                        >
                                            <i class="fa fa-plus"></i>
                                            Nuevo
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <b-col lg="10" class="my-1">
                                        <b-form-group
                                            label="Buscar"
                                            label-for="filter-input"
                                            label-cols-sm="3"
                                            label-align-sm="right"
                                            label-size="sm"
                                            class="mb-0"
                                        >
                                            <b-input-group size="sm">
                                                <b-form-input
                                                    id="filter-input"
                                                    v-model="filter"
                                                    type="search"
                                                    placeholder="Buscar"
                                                ></b-form-input>

                                                <b-input-group-append>
                                                    <b-button
                                                        variant="success"
                                                        :disabled="!filter"
                                                        @click="filter = ''"
                                                        >Borrar</b-button
                                                    >
                                                </b-input-group-append>
                                            </b-input-group>
                                        </b-form-group>
                                    </b-col>
                                    <div class="col-md-12">
                                        <b-overlay
                                            :show="showOverlay"
                                            rounded="sm"
                                        >
                                            <b-table
                                                :fields="fields"
                                                :items="listRegistros"
                                                show-empty
                                                stacked="md"
                                                responsive
                                                :current-page="currentPage"
                                                :per-page="perPage"
                                                @filtered="onFiltered"
                                                empty-text="Sin resultados"
                                                empty-filtered-text="Sin resultados"
                                                :filter="filter"
                                            >
                                                <template
                                                    #cell(estado_solicitud)="row"
                                                >
                                                    <span
                                                        class="text-md badge"
                                                        :class="{
                                                            'badge-danger':
                                                                row.item
                                                                    .estado_solicitud ==
                                                                'PENDIENTE',
                                                            'badge-success':
                                                                row.item
                                                                    .estado_solicitud ==
                                                                'ATENDIDO',
                                                            'badge-primary':
                                                                row.item
                                                                    .estado_solicitud ==
                                                                'NO RESPONDE',
                                                            'badge-warning':
                                                                row.item
                                                                    .estado_solicitud ==
                                                                'DESCARTADO',
                                                        }"
                                                    >
                                                        {{
                                                            row.item
                                                                .estado_solicitud
                                                        }}
                                                    </span>
                                                </template>
                                                <template #cell(mas)="row">
                                                    <b-button
                                                        variant="success"
                                                        size="sm"
                                                        @click="
                                                            row.toggleDetails
                                                        "
                                                    >
                                                        {{
                                                            row.detailsShowing
                                                                ? "Ocultar"
                                                                : "Mostrar"
                                                        }}
                                                        Detalles
                                                    </b-button>
                                                </template>

                                                <template #row-details="row">
                                                    <b-card>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Sexo:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.sexo
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Nacionalidad:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .nacionalidad
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Fecha de
                                                                    nacimiento:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .fecha_nac
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Teléfono/Celular:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.fono
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-button
                                                            size="sm"
                                                            variant="success"
                                                            @click="
                                                                row.toggleDetails
                                                            "
                                                            >Ocultar</b-button
                                                        >
                                                    </b-card>
                                                </template>
                                                <template #cell(accion)="row">
                                                    <div
                                                        class="row justify-content-between"
                                                    >
                                                        <b-button
                                                            size="sm"
                                                            pill
                                                            variant="outline-success"
                                                            class="btn-flat btn-block"
                                                            title="Ver Solicitud"
                                                            @click="
                                                                verSolicitud(
                                                                    row.item
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-clipboard-list"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'gestoria_solicituds.destroy'
                                                                )
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar registro"
                                                            @click="
                                                                eliminaGestoriaSolicitud(
                                                                    row.item.id,
                                                                    `<h4>¿Está seguro(a) de eliminar la solicitud con código ${row.item.codigo}?</h4><h4>Esta acción no se podrá deshacer después</h4>`
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-trash"
                                                            ></i>
                                                        </b-button>
                                                    </div>
                                                </template>
                                            </b-table>
                                        </b-overlay>
                                        <div class="row">
                                            <b-col
                                                sm="6"
                                                md="2"
                                                class="ml-auto my-1"
                                            >
                                                <b-form-select
                                                    align="right"
                                                    id="per-page-select"
                                                    v-model="perPage"
                                                    :options="pageOptions"
                                                    size="sm"
                                                ></b-form-select>
                                            </b-col>
                                            <b-col
                                                sm="6"
                                                md="2"
                                                class="my-1 mr-auto"
                                                v-if="perPage"
                                            >
                                                <b-pagination
                                                    v-model="currentPage"
                                                    :total-rows="totalRows"
                                                    :per-page="perPage"
                                                    align="left"
                                                ></b-pagination>
                                            </b-col>
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
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            search: "",
            listRegistros: [],
            showOverlay: false,
            fields: [
                {
                    key: "codigo",
                    label: "Código",
                    sortable: true,
                },
                { key: "full_name", label: "Nombre Completo", sortable: true },
                {
                    key: "correo",
                    label: "Correo",
                    sortable: true,
                },
                {
                    key: "fono",
                    label: "Teléfono/Celular",
                    sortable: true,
                },
                {
                    key: "edad",
                    label: "Edad",
                    sortable: true,
                },
                {
                    key: "estado_solicitud",
                    label: "Estado Solicitud",
                    sortable: true,
                },
                { key: "mas", label: "Ver mas" },
                {
                    key: "fecha_registro_t",
                    label: "Fecha de registro",
                    sortable: true,
                },
                { key: "accion", label: "Acción" },
            ],
            loading: true,
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            muestra_modal: false,
            modal_accion: "nuevo",
            oGestoriaSolicitud: {
                id: 0,
                nombre: "",
                descripcion: "",
                estado: "ACTIVO",
            },
            currentPage: 1,
            perPage: 5,
            pageOptions: [
                { value: 5, text: "Mostrar 5 Registros" },
                { value: 10, text: "Mostrar 10 Registros" },
                { value: 25, text: "Mostrar 25 Registros" },
                { value: 50, text: "Mostrar 50 Registros" },
                { value: 100, text: "Mostrar 100 Registros" },
                { value: this.totalRows, text: "Mostrar Todo" },
            ],
            totalRows: 10,
            filter: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getGestoriaSolicituds();
    },
    methods: {
        // Seleccionar Opciones de Tabla
        verSolicitud(item) {
            this.$router.push({
                name: "gestoria_solicituds.show",
                params: { id: item.id },
            });
        },

        // Listar GestoriaSolicitudse
        getGestoriaSolicituds() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/gestoria_solicituds";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.gestoria_solicituds;
                    this.totalRows = res.data.total;
                });
        },
        eliminaGestoriaSolicitud(id, descripcion) {
            Swal.fire({
                title: "¿Quierés eliminar este registro?",
                html: `<strong>${descripcion}</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#da1900",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    axios
                        .post(main_url + "/admin/gestoria_solicituds/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.getGestoriaSolicituds();
                            this.filter = "";
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 1500,
                            });
                        })
                        .catch((error) => {
                            if (error.response) {
                                if (error.response.status === 422) {
                                    this.errors = error.response.data.errors;
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
                                        showConfirmButton: false,
                                        timer: 2000,
                                    });
                                }
                            }
                        });
                }
            });
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
        limpiaGestoriaSolicitud() {
            this.oGestoriaSolicitud.nombre = "";
            this.oGestoriaSolicitud.descripcion = "";
            this.oGestoriaSolicitud.acceso = "0";
        },
        formatoFecha(date) {
            return this.$moment(String(date)).format("DD/MM/YYYY");
        },
    },
};
</script>

<style>
.contenedor_gestoria_solicituds .img_gestoria_solicitud {
    height: 100px;
}
</style>
