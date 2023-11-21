<?php

namespace App\Http\Controllers;

use App\Models\Configuracion;
use App\Models\Curso;
use App\Models\GestoriaSolicitud;
use App\Models\Grupo;
use App\Models\Horario;
use App\Models\Inscripcion;
use App\Models\InscripcionSolicitud;
use App\Models\Profesor;
use App\Models\User;
use Illuminate\Http\Request;
use PDF;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

class ReporteController extends Controller
{
    public $styleTexto = [
        'font' => [
            'bold' => true,
            'size' => 12,
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            ],
        ],
    ];

    public $styleArray2 = [
        'font' => [
            'bold' => true,
            'size' => 9,
            'color' => ['argb' => 'ffffff'],
        ],
        'alignment' => [
            'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            ],
        ],
        'fill' => [
            'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
            'color' => ['rgb' => '03a898']
        ],
    ];

    public $estilo_conenido = [
        'font' => [
            'size' => 8,
        ],
        'alignment' => [
            'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            ],
        ],
    ];

    public function usuarios(Request $request)
    {
        $filtro =  $request->filtro;
        $usuarios = User::where('id', '!=', 1)->whereNotIn("tipo", ["ESTUDIANTE", "PROFESOR"])->orderBy("paterno", "ASC")->get();

        if ($filtro == 'Tipo de usuario') {
            $request->validate([
                'tipo' => 'required',
            ]);
            $usuarios = User::where('id', '!=', 1)->where('tipo', $request->tipo)->orderBy("paterno", "ASC")->get();
        }

        $pdf = PDF::loadView('reportes.usuarios', compact('usuarios'))->setPaper('legal', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('Usuarios.pdf');
    }


    public function profesors(Request $request)
    {
        $filtro =  $request->filtro;

        $profesors = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "profesor_id" => "required",
            ], [
                "profesor_id.required" => "Selecciona un profesor de la lista"
            ]);
            $profesors = Profesor::where("id", $request->profesor_id)->get();
        } else {
            $profesors = Profesor::all();
        }

        $pdf = PDF::loadView('reportes.profesors', compact('profesors'))->setPaper('letter', 'potrait');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('profesores.pdf');
    }
    public function profesors_excel(Request $request)
    {
        $filtro =  $request->filtro;

        $profesors = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "profesor_id" => "required",
            ], [
                "profesor_id.required" => "Selecciona un profesor de la lista"
            ]);
            $profesors = Profesor::where("id", $request->profesor_id)->get();
        } else {
            $profesors = Profesor::all();
        }

        // ENCABEZADO EXCEL
        $spreadsheet = new Spreadsheet();
        $spreadsheet->getProperties()
            ->setCreator("ADMIN")
            ->setLastModifiedBy('Administración')
            ->setTitle('ListaProfesors')
            ->setSubject('ListaProfesors')
            ->setDescription('ListaProfesors')
            ->setKeywords('PHPSpreadsheet')
            ->setCategory('Listado');

        $sheet = $spreadsheet->getActiveSheet();

        $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

        // CONTENIDO ARCHIVO
        $fila = 1;
        $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
        $drawing->setName('logo');
        $drawing->setDescription('logo');
        $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo); // put your path and image here
        $drawing->setCoordinates('A' . $fila);
        $drawing->setOffsetX(5);
        $drawing->setOffsetY(0);
        $drawing->setHeight(60);
        $drawing->setWorksheet($sheet);
        $sheet->setCellValue('A' . $fila, "LISTA DE PROFESORES");
        $sheet->mergeCells("A" . $fila . ":I" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('A' . $fila . ':I' . $fila)->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A' . $fila . ':I' . $fila)->applyFromArray($this->styleTexto);
        $fila++;
        $fila++;
        $fila++;
        $fila++;

        $sheet->setCellValue('A' . $fila, 'N°');
        $sheet->setCellValue('B' . $fila, 'NOMBRE COMPLETO');
        $sheet->setCellValue('C' . $fila, 'C.I.');
        $sheet->setCellValue('D' . $fila, 'NACIONALIDAD');
        $sheet->setCellValue('E' . $fila, 'PAÍS DE RESIDENCIA');
        $sheet->setCellValue('F' . $fila, 'DIRECCIÓN');
        $sheet->setCellValue('G' . $fila, 'TELÉFONO/CELULAR');
        $sheet->setCellValue('H' . $fila, 'ESPECIALIDAD');
        $sheet->setCellValue('I' . $fila, 'EMAIL');
        $sheet->getStyle('A' . $fila . ':I' . $fila)->applyFromArray($this->styleArray2);
        $fila++;

        $cont = 1;
        foreach ($profesors as $value) {
            $sheet->setCellValue('A' . $fila, $cont++);
            $sheet->setCellValue('B' . $fila, $value->full_name);
            $sheet->setCellValue('C' . $fila, $value->ci);
            $sheet->setCellValue('D' . $fila, $value->nacionalidad);
            $sheet->setCellValue('E' . $fila, $value->pais_residencia);
            $sheet->setCellValue('F' . $fila, $value->dir);
            $sheet->setCellValue('G' . $fila, $value->fono);
            $sheet->setCellValue('H' . $fila, $value->especialidad);
            $sheet->setCellValue('I' . $fila, $value->correo);
            $sheet->getStyle('A' . $fila . ':I' . $fila)->applyFromArray($this->estilo_conenido);
            $fila++;
        }

        $sheet->getColumnDimension('A')->setWidth(8);
        $sheet->getColumnDimension('B')->setWidth(15);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(20);
        $sheet->getColumnDimension('E')->setWidth(15);
        $sheet->getColumnDimension('F')->setWidth(15);
        $sheet->getColumnDimension('G')->setWidth(15);
        $sheet->getColumnDimension('H')->setWidth(15);
        $sheet->getColumnDimension('I')->setWidth(15);

        foreach (range('A', 'I') as $columnID) {
            $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
        }

        // PARA IMPRESIONES
        $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_PORTRAIT);
        $sheet->getPageMargins()->setTop(0.5);
        $sheet->getPageMargins()->setRight(0.1);
        $sheet->getPageMargins()->setLeft(0.1);
        $sheet->getPageMargins()->setBottom(0.1);
        $sheet->getPageSetup()->setPrintArea('A:I');
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);

        // DESCARGA DEL ARCHIVO
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="ListaProfesors.xlsx"');
        header('Cache-Control: max-age=0');
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
    }
    public function estudiantes(Request $request)
    {
        $filtro =  $request->filtro;

        $estudiantes = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "estado" => "required",
            ], [
                "estado.required" => "Selecciona un estudiante de la lista"
            ]);
            if ($request->estado != 'TODOS') {
                $estudiantes = Inscripcion::where("estado_ultima_solicitud", $request->estado)->get();
            } else {
                $estudiantes = Inscripcion::all();
            }
        } else {
            $estudiantes = Inscripcion::all();
        }

        $pdf = PDF::loadView('reportes.estudiantes', compact('estudiantes'))->setPaper('letter', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('estudiantes.pdf');
    }
    public function estudiantes_excel(Request $request)
    {
        $filtro =  $request->filtro;

        $estudiantes = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "estado" => "required",
            ], [
                "estado.required" => "Selecciona un estudiante de la lista"
            ]);
            $estudiantes = Inscripcion::where("estado_ultima_solicitud", $request->estado)->get();
        } else {
            $estudiantes = Inscripcion::all();
        }

        // ENCABEZADO EXCEL
        $spreadsheet = new Spreadsheet();
        $spreadsheet->getProperties()
            ->setCreator("ADMIN")
            ->setLastModifiedBy('Administración')
            ->setTitle('ListaEstudiantes')
            ->setSubject('ListaEstudiantes')
            ->setDescription('ListaEstudiantes')
            ->setKeywords('PHPSpreadsheet')
            ->setCategory('Listado');

        $sheet = $spreadsheet->getActiveSheet();

        $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

        // CONTENIDO ARCHIVO
        $fila = 1;
        $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
        $drawing->setName('logo');
        $drawing->setDescription('logo');
        $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo); // put your path and image here
        $drawing->setCoordinates('A' . $fila);
        $drawing->setOffsetX(5);
        $drawing->setOffsetY(0);
        $drawing->setHeight(60);
        $drawing->setWorksheet($sheet);
        $sheet->setCellValue('A' . $fila, "LISTA DE ESTUDIANTES");
        $sheet->mergeCells("A" . $fila . ":L" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('A' . $fila . ':L' . $fila)->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A' . $fila . ':L' . $fila)->applyFromArray($this->styleTexto);
        $fila++;
        $fila++;
        $fila++;
        $fila++;

        $sheet->setCellValue('A' . $fila, 'N°');
        $sheet->setCellValue('B' . $fila, 'NOMBRE COMPLETO');
        $sheet->setCellValue('C' . $fila, 'NRO. IDENTIFICACIÓN');
        $sheet->setCellValue('D' . $fila, 'FECHA DE NACIMIENTO');
        $sheet->setCellValue('E' . $fila, 'EDAD');
        $sheet->setCellValue('F' . $fila, 'PAÍS DE RESIDENCIA');
        $sheet->setCellValue('G' . $fila, 'NACIONALIDAD');
        $sheet->setCellValue('H' . $fila, 'PROVINCIA/DEPARTAMENTO');
        $sheet->setCellValue('I' . $fila, 'SEXO');
        $sheet->setCellValue('J' . $fila, 'TELÉFONO/CELULAR');
        $sheet->setCellValue('K' . $fila, 'EMAIL');
        $sheet->setCellValue('L' . $fila, 'ESTADO');
        $sheet->getStyle('A' . $fila . ':L' . $fila)->applyFromArray($this->styleArray2);
        $fila++;

        $cont = 1;
        foreach ($estudiantes as $value) {
            $sheet->setCellValue('A' . $fila, $cont++);
            $sheet->setCellValue('B' . $fila, $value->full_name);
            $sheet->setCellValue('C' . $fila, $value->nro_iden);
            $sheet->setCellValue('D' . $fila, $value->fecha_nac);
            $sheet->setCellValue('E' . $fila, $value->edad);
            $sheet->setCellValue('F' . $fila, $value->pais_residencia);
            $sheet->setCellValue('G' . $fila, $value->nacionalidad);
            $sheet->setCellValue('H' . $fila, $value->prov_dpto);
            $sheet->setCellValue('I' . $fila, $value->sexo);
            $sheet->setCellValue('J' . $fila, $value->fono);
            $sheet->setCellValue('K' . $fila, $value->correo);
            $sheet->setCellValue('L' . $fila, $value->estado_ultima_solicitud);
            $sheet->getStyle('A' . $fila . ':L' . $fila)->applyFromArray($this->estilo_conenido);
            $fila++;
        }

        $sheet->getColumnDimension('A')->setWidth(8);
        $sheet->getColumnDimension('B')->setWidth(30);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(20);
        $sheet->getColumnDimension('E')->setWidth(10);
        $sheet->getColumnDimension('F')->setWidth(15);
        $sheet->getColumnDimension('G')->setWidth(15);
        $sheet->getColumnDimension('H')->setWidth(25);
        $sheet->getColumnDimension('I')->setWidth(15);
        $sheet->getColumnDimension('J')->setWidth(15);
        $sheet->getColumnDimension('K')->setWidth(25);
        $sheet->getColumnDimension('L')->setWidth(25);

        foreach (range('A', 'L') as $columnID) {
            $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
        }

        // PARA IMPRESIONES
        $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
        $sheet->getPageMargins()->setTop(0.5);
        $sheet->getPageMargins()->setRight(0.1);
        $sheet->getPageMargins()->setLeft(0.1);
        $sheet->getPageMargins()->setBottom(0.1);
        $sheet->getPageSetup()->setPrintArea('A:L');
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);

        // DESCARGA DEL ARCHIVO
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="ListaEstudiantes.xlsx"');
        header('Cache-Control: max-age=0');
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
    }


    public function historial_estudiante(Request $request)
    {
        $request->validate([
            "estudiante_id" => "required"
        ], [
            "estudiante_id.required" => "Debes seleccionar un estudiante"
        ]);

        $estudiante_id =  $request->estudiante_id;

        $inscripcion = Inscripcion::findOrFail($estudiante_id);

        $inscripcion_solicituds = InscripcionSolicitud::where("inscripcion_id", $inscripcion->id)->get();

        $pdf = PDF::loadView('reportes.historial_estudiante', compact('inscripcion', 'inscripcion_solicituds'))->setPaper('letter', 'portrait');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('historial_estudiante.pdf');
    }
    public function historial_estudiante_excel(Request $request)
    {
        $request->validate([
            "estudiante_id" => "required"
        ], [
            "estudiante_id.required" => "Debes seleccionar un estudiante"
        ]);

        $estudiante_id =  $request->estudiante_id;

        $inscripcion = Inscripcion::findOrFail($estudiante_id);

        $inscripcion_solicituds = InscripcionSolicitud::where("inscripcion_id", $inscripcion->id)->get();

        // ENCABEZADO EXCEL
        $spreadsheet = new Spreadsheet();
        $spreadsheet->getProperties()
            ->setCreator("ADMIN")
            ->setLastModifiedBy('Administración')
            ->setTitle('ListaEstudiantes')
            ->setSubject('ListaEstudiantes')
            ->setDescription('ListaEstudiantes')
            ->setKeywords('PHPSpreadsheet')
            ->setCategory('Listado');

        $sheet = $spreadsheet->getActiveSheet();

        $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

        // CONTENIDO ARCHIVO
        $fila = 1;
        $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
        $drawing->setName('logo');
        $drawing->setDescription('logo');
        $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo); // put your path and image here
        $drawing->setCoordinates('A' . $fila);
        $drawing->setOffsetX(5);
        $drawing->setOffsetY(0);
        $drawing->setHeight(60);
        $drawing->setWorksheet($sheet);
        $fila++;
        $fila++;
        $sheet->setCellValue('A' . $fila, "HISTORIAL DE ESTUDIANTE");
        $sheet->mergeCells("A" . $fila . ":H" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('A' . $fila . ':H' . $fila)->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($this->styleTexto);
        $fila++;
        $fila++;

        $sheet->setCellValue('A' . $fila, "Nombre completo: " . $inscripcion->full_name);
        $sheet->mergeCells("A" . $fila . ":D" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('A' . $fila . ':D' . $fila)->applyFromArray($this->estilo_conenido);
        $sheet->setCellValue('E' . $fila, "Nro. Identificación: " . $inscripcion->nro_iden);
        $sheet->mergeCells("E" . $fila . ":H" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('E' . $fila . ':H' . $fila)->applyFromArray($this->estilo_conenido);
        $fila++;
        $sheet->setCellValue('A' . $fila, "Email: " . $inscripcion->correo);
        $sheet->mergeCells("A" . $fila . ":D" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('A' . $fila . ':D' . $fila)->applyFromArray($this->estilo_conenido);
        $sheet->setCellValue('E' . $fila, "Edad: " . $inscripcion->edad . ' años');
        $sheet->mergeCells("E" . $fila . ":H" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('E' . $fila . ':H' . $fila)->applyFromArray($this->estilo_conenido);
        $fila++;
        $sheet->setCellValue('A' . $fila, "País residencia: " . $inscripcion->pais_residencia);
        $sheet->mergeCells("A" . $fila . ":D" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('A' . $fila . ':D' . $fila)->applyFromArray($this->estilo_conenido);
        $sheet->setCellValue('E' . $fila, "Teléfono: " . $inscripcion->fono);
        $sheet->mergeCells("E" . $fila . ":H" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('E' . $fila . ':H' . $fila)->applyFromArray($this->estilo_conenido);
        $fila++;
        $fila++;

        $sheet->setCellValue('A' . $fila, "LISTA DE SOLICITUDES");
        $sheet->mergeCells("A" . $fila . ":H" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('A' . $fila . ':H' . $fila)->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($this->styleTexto);
        $fila++;
        $fila++;

        $sheet->setCellValue('A' . $fila, 'N°');
        $sheet->setCellValue('B' . $fila, 'CÓDIGO');
        $sheet->setCellValue('C' . $fila, 'CURSO');
        $sheet->setCellValue('D' . $fila, 'NIVEL');
        $sheet->setCellValue('E' . $fila, 'PLAN DE PAGO');
        $sheet->setCellValue('F' . $fila, 'FORMA DE PAGO');
        $sheet->setCellValue('G' . $fila, 'FECHA DE INSCRIPCIÓN');
        $sheet->setCellValue('H' . $fila, 'ESTADO');
        $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($this->styleArray2);
        $fila++;

        $cont = 1;
        foreach ($inscripcion_solicituds as $value) {
            $sheet->setCellValue('A' . $fila, $cont++);
            $sheet->setCellValue('B' . $fila, $value->codigo);
            $sheet->setCellValue('C' . $fila, $value->curso->nombre);
            $sheet->setCellValue('D' . $fila, $value->nivel);
            $sheet->setCellValue('E' . $fila, mb_strtoupper($value->plan_pago->titulo));
            $sheet->setCellValue('F' . $fila, $value->forma_pago);
            $sheet->setCellValue('G' . $fila, date('d/m/Y', strtotime($value->created_at)));
            if ($value->asignacion_grupo) {
                if (!$value->asignacion_grupo->abandono) {
                    $calificacion = "\nCalificación: " . $value->asignacion_grupo->calificacion;
                    $sheet->setCellValue('H' . $fila, $value->asignacion_grupo->estado . $calificacion);
                } else {
                    $sheet->setCellValue('H' . $fila, 'ABANDONÓ');
                }
            } else {
                $sheet->setCellValue('H' . $fila, "sin asignar");
            }
            $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($this->estilo_conenido);
            $fila++;
        }

        $sheet->getColumnDimension('A')->setWidth(8);
        $sheet->getColumnDimension('B')->setWidth(15);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(20);
        $sheet->getColumnDimension('E')->setWidth(20);
        $sheet->getColumnDimension('F')->setWidth(20);
        $sheet->getColumnDimension('G')->setWidth(15);
        $sheet->getColumnDimension('H')->setWidth(15);

        foreach (range('A', 'H') as $columnID) {
            $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
        }

        // PARA IMPRESIONES
        $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
        $sheet->getPageMargins()->setTop(0.5);
        $sheet->getPageMargins()->setRight(0.1);
        $sheet->getPageMargins()->setLeft(0.1);
        $sheet->getPageMargins()->setBottom(0.1);
        $sheet->getPageSetup()->setPrintArea('A:H');
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);

        // DESCARGA DEL ARCHIVO
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="HistorialEstudiante.xlsx"');
        header('Cache-Control: max-age=0');
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
    }

    public function estudiantes_grupos(Request $request)
    {
        $filtro =  $request->filtro;
        $estudiantes = [];
        $grupos = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "grupo_id" => "required",
            ], [
                "grupo_id.required" => "Selecciona un estudiante de la lista"
            ]);
            $grupos = Grupo::where("id", $request->grupo_id)->get();
        } else {
            $grupos = Grupo::all();
        }

        $pdf = PDF::loadView('reportes.estudiantes_grupos', compact('grupos'))->setPaper('letter', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('estudiantes_grupos.pdf');
    }
    public function estudiantes_grupos_excel(Request $request)
    {
        $filtro =  $request->filtro;
        $estudiantes = [];
        $grupos = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "grupo_id" => "required",
            ], [
                "grupo_id.required" => "Selecciona un estudiante de la lista"
            ]);
            $grupos = Grupo::where("id", $request->grupo_id)->get();
        } else {
            $grupos = Grupo::all();
        }
        // ENCABEZADO EXCEL
        $spreadsheet = new Spreadsheet();
        $spreadsheet->getProperties()
            ->setCreator("ADMIN")
            ->setLastModifiedBy('Administración')
            ->setTitle('ListaEstudiantesGrupos')
            ->setSubject('ListaEstudiantesGrupos')
            ->setDescription('ListaEstudiantesGrupos')
            ->setKeywords('PHPSpreadsheet')
            ->setCategory('Listado');

        $sheet = $spreadsheet->getActiveSheet();

        $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

        // CONTENIDO ARCHIVO
        $fila = 1;
        $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
        $drawing->setName('logo');
        $drawing->setDescription('logo');
        $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo); // put your path and image here
        $drawing->setCoordinates('A' . $fila);
        $drawing->setOffsetX(5);
        $drawing->setOffsetY(0);
        $drawing->setHeight(60);
        $drawing->setWorksheet($sheet);
        $sheet->setCellValue('A' . $fila, "LISTA DE ESTUDIANTES POR GRUPOS");
        $sheet->mergeCells("A" . $fila . ":L" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('A' . $fila . ':L' . $fila)->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A' . $fila . ':L' . $fila)->applyFromArray($this->styleTexto);
        $fila++;
        $fila++;
        $fila++;
        $fila++;
        foreach ($grupos as $grupo) {
            $sheet->setCellValue('A' . $fila, $grupo->nombre);
            $sheet->mergeCells("A" . $fila . ":L" . $fila);  //COMBINAR CELDAS
            $fila++;
            $sheet->setCellValue('A' . $fila, 'N°');
            $sheet->setCellValue('B' . $fila, 'NOMBRE COMPLETO');
            $sheet->setCellValue('C' . $fila, 'NRO. IDENTIFICACIÓN');
            $sheet->setCellValue('D' . $fila, 'FECHA DE NACIMIENTO');
            $sheet->setCellValue('E' . $fila, 'EDAD');
            $sheet->setCellValue('F' . $fila, 'PAÍS DE RESIDENCIA');
            $sheet->setCellValue('G' . $fila, 'NACIONALIDAD');
            $sheet->setCellValue('H' . $fila, 'PROVINCIA/DEPARTAMENTO');
            $sheet->setCellValue('I' . $fila, 'SEXO');
            $sheet->setCellValue('J' . $fila, 'TELÉFONO/CELULAR');
            $sheet->setCellValue('K' . $fila, 'EMAIL');
            $sheet->setCellValue('L' . $fila, 'CURSO');
            $sheet->getStyle('A' . $fila . ':L' . $fila)->applyFromArray($this->styleArray2);
            $fila++;
            $cont = 1;
            foreach ($grupo->asignacion_grupos as $value) {
                $sheet->setCellValue('A' . $fila, $cont++);
                $sheet->setCellValue('B' . $fila, $value->inscripcion->full_name);
                $sheet->setCellValue('C' . $fila, $value->inscripcion->nro_iden);
                $sheet->setCellValue('D' . $fila, $value->inscripcion->fecha_nac);
                $sheet->setCellValue('E' . $fila, $value->inscripcion->edad);
                $sheet->setCellValue('F' . $fila, $value->inscripcion->pais_residencia);
                $sheet->setCellValue('G' . $fila, $value->inscripcion->nacionalidad);
                $sheet->setCellValue('H' . $fila, $value->inscripcion->prov_dpto);
                $sheet->setCellValue('I' . $fila, $value->inscripcion->sexo);
                $sheet->setCellValue('J' . $fila, $value->inscripcion->fono);
                $sheet->setCellValue('K' . $fila, $value->inscripcion->correo);
                $sheet->setCellValue('L' . $fila, $value->curso->nombre);
                $sheet->getStyle('A' . $fila . ':L' . $fila)->applyFromArray($this->estilo_conenido);
                $fila++;
            }
            $fila++;
            $fila++;
        }

        $sheet->getColumnDimension('A')->setWidth(8);
        $sheet->getColumnDimension('B')->setWidth(30);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(20);
        $sheet->getColumnDimension('E')->setWidth(10);
        $sheet->getColumnDimension('F')->setWidth(15);
        $sheet->getColumnDimension('G')->setWidth(15);
        $sheet->getColumnDimension('H')->setWidth(25);
        $sheet->getColumnDimension('I')->setWidth(15);
        $sheet->getColumnDimension('J')->setWidth(15);
        $sheet->getColumnDimension('K')->setWidth(25);
        $sheet->getColumnDimension('L')->setWidth(25);

        foreach (range('A', 'L') as $columnID) {
            $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
        }

        // PARA IMPRESIONES
        $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
        $sheet->getPageMargins()->setTop(0.5);
        $sheet->getPageMargins()->setRight(0.1);
        $sheet->getPageMargins()->setLeft(0.1);
        $sheet->getPageMargins()->setBottom(0.1);
        $sheet->getPageSetup()->setPrintArea('A:L');
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);

        // DESCARGA DEL ARCHIVO
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="ListaEstudiantesGrupos.xlsx"');
        header('Cache-Control: max-age=0');
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
    }
    public function horarios(Request $request)
    {
        $filtro =  $request->filtro;
        $horarios = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "grupo_id" => "required",
            ], [
                "grupo_id.required" => "Selecciona un profesor de la lista"
            ]);
            $horarios = Horario::where("grupo_id", $request->grupo_id)->get();
        } else {
            $horarios = Horario::all();
        }

        $pdf = PDF::loadView('reportes.horarios', compact('horarios'))->setPaper('letter', 'potrait');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('horarios.pdf');
    }
    public function horarios_excel(Request $request)
    {
        $filtro =  $request->filtro;
        $horarios = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "grupo_id" => "required",
            ], [
                "grupo_id.required" => "Selecciona un profesor de la lista"
            ]);
            $horarios = Horario::where("grupo_id", $request->grupo_id)->get();
        } else {
            $horarios = Horario::all();
        }
        // ENCABEZADO EXCEL
        $spreadsheet = new Spreadsheet();
        $spreadsheet->getProperties()
            ->setCreator("ADMIN")
            ->setLastModifiedBy('Administración')
            ->setTitle('ListaHorarios')
            ->setSubject('ListaHorarios')
            ->setDescription('ListaHorarios')
            ->setKeywords('PHPSpreadsheet')
            ->setCategory('Listado');

        $sheet = $spreadsheet->getActiveSheet();

        $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

        // CONTENIDO ARCHIVO
        $fila = 1;
        $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
        $drawing->setName('logo');
        $drawing->setDescription('logo');
        $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo); // put your path and image here
        $drawing->setCoordinates('A' . $fila);
        $drawing->setOffsetX(5);
        $drawing->setOffsetY(0);
        $drawing->setHeight(60);
        $drawing->setWorksheet($sheet);
        $sheet->setCellValue('A' . $fila, "LISTA DE HORARIOS");
        $sheet->mergeCells("A" . $fila . ":H" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('A' . $fila . ':H' . $fila)->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($this->styleTexto);
        $fila++;
        $fila++;
        $fila++;
        $fila++;

        $sheet->setCellValue('A' . $fila, 'N°');
        $sheet->setCellValue('B' . $fila, 'GRUPO');
        $sheet->setCellValue('C' . $fila, 'MODALIDAD');
        $sheet->setCellValue('D' . $fila, 'DÍAS');
        $sheet->setCellValue('E' . $fila, 'FECHA INICIO');
        $sheet->setCellValue('F' . $fila, 'FECHA FIN');
        $sheet->setCellValue('G' . $fila, 'HORA INICIO');
        $sheet->setCellValue('H' . $fila, 'HORA FIN');
        $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($this->styleArray2);
        $fila++;

        $cont = 1;
        foreach ($horarios as $value) {
            $sheet->setCellValue('A' . $fila, $cont++);
            $sheet->setCellValue('B' . $fila, $value->grupo->nombre);
            $sheet->setCellValue('C' . $fila, $value->modalidad);
            $sheet->setCellValue('D' . $fila, $value->dias_txt);
            $sheet->setCellValue('E' . $fila, $value->fecha_inicio_t);
            $sheet->setCellValue('F' . $fila, $value->fecha_fin_t);
            $sheet->setCellValue('G' . $fila, $value->hora_inicio_t);
            $sheet->setCellValue('H' . $fila, $value->hora_fin_t);
            $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($this->estilo_conenido);
            $fila++;
        }

        $sheet->getColumnDimension('A')->setWidth(8);
        $sheet->getColumnDimension('B')->setWidth(15);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(20);
        $sheet->getColumnDimension('E')->setWidth(15);
        $sheet->getColumnDimension('F')->setWidth(15);
        $sheet->getColumnDimension('G')->setWidth(15);
        $sheet->getColumnDimension('H')->setWidth(15);

        foreach (range('A', 'H') as $columnID) {
            $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
        }

        // PARA IMPRESIONES
        $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_PORTRAIT);
        $sheet->getPageMargins()->setTop(0.5);
        $sheet->getPageMargins()->setRight(0.1);
        $sheet->getPageMargins()->setLeft(0.1);
        $sheet->getPageMargins()->setBottom(0.1);
        $sheet->getPageSetup()->setPrintArea('A:H');
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);

        // DESCARGA DEL ARCHIVO
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="Horarios.xlsx"');
        header('Cache-Control: max-age=0');
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
    }
    public function examen_nivelacion(Request $request)
    {
        $filtro =  $request->filtro;
        $cursos = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "curso_id" => "required",
            ], [
                "curso_id.required" => "Selecciona un profesor de la lista"
            ]);
            $cursos = Curso::where("id", $request->curso_id)->get();
        } else {
            $cursos = Curso::all();
        }

        $pdf = PDF::loadView('reportes.examen_nivelacion', compact('cursos'))->setPaper('legal', 'potrait');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('cursos.pdf');
    }
    public function gestoria_solicituds(Request $request)
    {
        $filtro =  $request->filtro;

        $gestoria_solicituds = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "estado" => "required",
            ], [
                "estado.required" => "Debes seleccionar un estado"
            ]);
            if ($request->estado != 'TODOS') {
                $gestoria_solicituds = GestoriaSolicitud::where("estado_solicitud", $request->estado)->get();
            } else {
                $gestoria_solicituds = GestoriaSolicitud::all();
            }
        } else {
            $gestoria_solicituds = GestoriaSolicitud::all();
        }

        $pdf = PDF::loadView('reportes.gestoria_solicituds', compact('gestoria_solicituds'))->setPaper('legal', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('gestoria_solicituds.pdf');
    }
    public function gestoria_solicituds_excel(Request $request)
    {
        $filtro =  $request->filtro;

        $gestoria_solicituds = [];
        if ($filtro != 'Todos') {
            $request->validate([
                "estado" => "required",
            ], [
                "estado.required" => "Debes seleccionar un estado"
            ]);
            if ($request->estado != 'TODOS') {
                $gestoria_solicituds = GestoriaSolicitud::where("estado_solicitud", $request->estado)->get();
            } else {
                $gestoria_solicituds = GestoriaSolicitud::all();
            }
        } else {
            $gestoria_solicituds = GestoriaSolicitud::all();
        }

        // ENCABEZADO EXCEL
        $spreadsheet = new Spreadsheet();
        $spreadsheet->getProperties()
            ->setCreator("ADMIN")
            ->setLastModifiedBy('Administración')
            ->setTitle('ListaEstudiantes')
            ->setSubject('ListaEstudiantes')
            ->setDescription('ListaEstudiantes')
            ->setKeywords('PHPSpreadsheet')
            ->setCategory('Listado');

        $sheet = $spreadsheet->getActiveSheet();

        $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

        // CONTENIDO ARCHIVO
        $fila = 1;
        $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
        $drawing->setName('logo');
        $drawing->setDescription('logo');
        $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo); // put your path and image here
        $drawing->setCoordinates('A' . $fila);
        $drawing->setOffsetX(5);
        $drawing->setOffsetY(0);
        $drawing->setHeight(60);
        $drawing->setWorksheet($sheet);
        $sheet->setCellValue('A' . $fila, "SOLICITUD DE SERIVICIO GESTORÍA");
        $sheet->mergeCells("A" . $fila . ":Z" . $fila);  //COMBINAR CELDAS
        $sheet->getStyle('A' . $fila . ':Z' . $fila)->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A' . $fila . ':Z' . $fila)->applyFromArray($this->styleTexto);
        $fila++;
        $fila++;
        $fila++;
        $fila++;

        $sheet->setCellValue('A' . $fila, 'CÓDIGO');
        $sheet->setCellValue('B' . $fila, 'NOMBRE COMPLETO');
        $sheet->setCellValue('C' . $fila, 'FECHA DE NACIMIENTO');
        $sheet->setCellValue('D' . $fila, 'EDAD');
        $sheet->setCellValue('E' . $fila, 'NACIONALIDAD');
        $sheet->setCellValue('F' . $fila, 'ESTADO');
        $sheet->setCellValue('G' . $fila, 'SEXO');
        $sheet->setCellValue('H' . $fila, 'TELÉFONO CELULAR');
        $sheet->setCellValue('I' . $fila, 'FAMILIARES EN ESTADOS UNIDOS');
        $sheet->setCellValue('J' . $fila, 'PARENTESCO');
        $sheet->setCellValue('K' . $fila, 'FAMILIAR DEPORTADO');
        $sheet->setCellValue('L' . $fila, 'MOTIVO');
        $sheet->setCellValue('M' . $fila, 'DEPORTADO DE OTRO PAÍS');
        $sheet->setCellValue('N' . $fila, 'MOTIVO');
        $sheet->setCellValue('O' . $fila, 'ANTECEDENTES PENALES');
        $sheet->setCellValue('P' . $fila, 'DESCRIPCIÓN OTRO');
        $sheet->setCellValue('Q' . $fila, 'ESTUDIOS');
        $sheet->setCellValue('R' . $fila, 'TRABAJO ACTUAL');
        $sheet->setCellValue('S' . $fila, 'SOLICITUD VISA ANTERIORMENTE');
        $sheet->setCellValue('T' . $fila, 'MOTIVO RECHAZO');
        $sheet->setCellValue('U' . $fila, 'TIENE CUENTA BANCARIA');
        $sheet->setCellValue('V' . $fila, 'GANA APROXIMADAMENTE');
        $sheet->setCellValue('W' . $fila, 'REDES SOCIALES');
        $sheet->setCellValue('X' . $fila, 'EMAIL');
        $sheet->setCellValue('Y' . $fila, 'RECOMENDADO POR');
        $sheet->setCellValue('Z' . $fila, 'ESTADO');
        $sheet->getStyle('A' . $fila . ':Z' . $fila)->applyFromArray($this->styleArray2);
        $fila++;

        $cont = 1;
        foreach ($gestoria_solicituds as $value) {
            $sheet->setCellValue('A' . $fila, $value->codigo);
            $sheet->setCellValue('B' . $fila, $value->full_name);
            $sheet->setCellValue('C' . $fila, $value->fecha_nac);
            $sheet->setCellValue('D' . $fila, $value->edad);
            $sheet->setCellValue('E' . $fila, $value->nacionalidad);
            $sheet->setCellValue('F' . $fila, $value->estado);
            $sheet->setCellValue('G' . $fila, $value->sexo);
            $sheet->setCellValue('H' . $fila, $value->fono);
            $sheet->setCellValue('I' . $fila, $value->familiares_eeuu);
            $sheet->setCellValue('J' . $fila, $value->parentesco);
            $sheet->setCellValue('K' . $fila, $value->familiar_deportado);
            $sheet->setCellValue('L' . $fila, $value->motivo);
            $sheet->setCellValue('M' . $fila, $value->deportado_otro_pais);
            $sheet->setCellValue('N' . $fila, $value->motivo_otro_pais);
            $sheet->setCellValue('O' . $fila, $value->antecedentes_penales);
            $sheet->setCellValue('P' . $fila, $value->des_antecedentes);
            $sheet->setCellValue('Q' . $fila, str_replace(["<br>", "<br/>", "<br />"], "", $value->estudios));
            $sheet->setCellValue('R' . $fila, $value->trabajo_actual);
            $sheet->setCellValue('S' . $fila, $value->solicito_visa);
            $sheet->setCellValue('T' . $fila, $value->motivo_rechazo);
            $sheet->setCellValue('U' . $fila, $value->cuenta_bancaria);
            $sheet->setCellValue('V' . $fila, $value->gana_aproximadamente);
            $sheet->setCellValue('W' . $fila, str_replace(["<br>", "<br/>", "<br />"], "", $value->redes_sociales));
            $sheet->setCellValue('X' . $fila, $value->correo);
            $sheet->setCellValue('Y' . $fila, str_replace(["<br>", "<br/>", "<br />"], "", $value->recomendado_por));
            $sheet->setCellValue('Z' . $fila, $value->estado_solicitud);
            $sheet->getStyle('A' . $fila . ':Z' . $fila)->applyFromArray($this->estilo_conenido);
            $fila++;
        }

        $sheet->getColumnDimension('A')->setWidth(8);
        $sheet->getColumnDimension('B')->setWidth(30);
        $sheet->getColumnDimension('C')->setWidth(10);
        $sheet->getColumnDimension('D')->setWidth(10);
        $sheet->getColumnDimension('E')->setWidth(10);
        $sheet->getColumnDimension('F')->setWidth(15);
        $sheet->getColumnDimension('G')->setWidth(15);
        $sheet->getColumnDimension('H')->setWidth(15);
        $sheet->getColumnDimension('I')->setWidth(15);
        $sheet->getColumnDimension('J')->setWidth(15);
        $sheet->getColumnDimension('K')->setWidth(25);
        $sheet->getColumnDimension('L')->setWidth(25);
        $sheet->getColumnDimension('M')->setWidth(25);
        $sheet->getColumnDimension('N')->setWidth(25);
        $sheet->getColumnDimension('O')->setWidth(25);
        $sheet->getColumnDimension('P')->setWidth(25);
        $sheet->getColumnDimension('Q')->setWidth(25);
        $sheet->getColumnDimension('R')->setWidth(25);
        $sheet->getColumnDimension('S')->setWidth(25);
        $sheet->getColumnDimension('T')->setWidth(25);
        $sheet->getColumnDimension('U')->setWidth(25);
        $sheet->getColumnDimension('V')->setWidth(25);
        $sheet->getColumnDimension('W')->setWidth(25);
        $sheet->getColumnDimension('X')->setWidth(25);
        $sheet->getColumnDimension('Y')->setWidth(25);
        $sheet->getColumnDimension('Z')->setWidth(10);

        foreach (range('A', 'Z') as $columnID) {
            $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
        }

        // PARA IMPRESIONES
        $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
        $sheet->getPageMargins()->setTop(0.5);
        $sheet->getPageMargins()->setRight(0.1);
        $sheet->getPageMargins()->setLeft(0.1);
        $sheet->getPageMargins()->setBottom(0.1);
        $sheet->getPageSetup()->setPrintArea('A:Z');
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);

        // DESCARGA DEL ARCHIVO
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="ListaEstudiantes.xlsx"');
        header('Cache-Control: max-age=0');
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
    }
}
