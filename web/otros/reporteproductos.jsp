<?php
    $conexion = new mysqli('localhost','ConMaharanee','m4h4r4n33','mhrninven');
	if (mysqli_connect_errno()) {
    	printf("La conexion con el servidor de base de datos fallo: %s\n", mysqli_connect_error());
    	exit();
	}
	$consulta = "SELECT IdProd, ImaGra, ImaUno, ImaDos, ImaCaj, VidPro, NomPro, CodPro, CarPro, MedPro, 
	PiePro, PreVen, OfePro, EstPro, NomCat FROM producto JOIN categoria where categoria_IdCate = IdCate";
	$resultado = $conexion->query($consulta);
	if($resultado->num_rows > 0 ){
						
		date_default_timezone_set('America/Mexico_City');

		if (PHP_SAPI == 'cli')
			die('Este archivo solo se puede ver desde un navegador web');

		/** Se agrega la libreria PHPExcel */
		require_once '../lib/PHPExcel/PHPExcel.php';

		// Se crea el objeto PHPExcel
		$objPHPExcel = new PHPExcel();

		// Se asignan las propiedades del libro
		$objPHPExcel->getProperties()->setCreator("08Bits") //Autor
							 ->setLastModifiedBy("Pedro Cruz") //Ultimo usuario que lo modificó
							 ->setTitle("Reporte de productos")
							 ->setSubject("Reporte de todos los productos en Maharanee.net")
							 ->setDescription("Reporte de los productos que hay en el catalogo de Maharanee.net")
							 ->setKeywords("reporte productos maharanee")
							 ->setCategory("Reporte excel");

		$tituloReporte = "Relación de los productos existentes en el catálogo";
		$titulosColumnas = array('NÚMERO INTERNO DEL PRODUCTO', 'NOMBRE DE LA IMAGEN 1', 'NOMBRE DE LA IMAGEN 2', 
		'NOMBRE DE LA IMAGEN 3', 'NOMBRE DE LA IMAGEN 4', 'ENLACE DE VIDEO DEL PRODUCTO', 'NOMBRE DEL PRODUCTO', 
		'CÓDIGO DEL PRODUCTO', 'CARACTERISTICAS DEL PRODUCTO', 'MEDIDAS DEL PRODUCTO', 'PIEZAS DEL PRODUCTO', 
		'PRECIO DE PRODCUTO', 'OFERTA DE PRECIO', 'ESTADO DEL PRODUCTO', 'CATEGORIA A LA QUE PERTENECE EL PRODUCTO');
		
		$objPHPExcel->setActiveSheetIndex(0)
        		    ->mergeCells('A1:O1');
						
		// Se agregan los titulos del reporte
		$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue('A1',$tituloReporte)
        		    ->setCellValue('A3',  $titulosColumnas[0])
		            ->setCellValue('B3',  $titulosColumnas[1])
        		    ->setCellValue('C3',  $titulosColumnas[2])
            		->setCellValue('D3',  $titulosColumnas[3])
            		->setCellValue('E3',  $titulosColumnas[4])
					->setCellValue('F3',  $titulosColumnas[5])
					->setCellValue('G3',  $titulosColumnas[6])
					->setCellValue('H3',  $titulosColumnas[7])
					->setCellValue('I3',  $titulosColumnas[8])
					->setCellValue('J3',  $titulosColumnas[9])
					->setCellValue('K3',  $titulosColumnas[10])
					->setCellValue('L3',  $titulosColumnas[11])
					->setCellValue('M3',  $titulosColumnas[12])
					->setCellValue('N3',  $titulosColumnas[13])
					->setCellValue('O3',  $titulosColumnas[14]);
		
		//Se agregan los datos de los productos
		$i = 4;
		while ($fila = $resultado->fetch_array()) {
			$objPHPExcel->setActiveSheetIndex(0)
        		    ->setCellValue('A'.$i,  $fila['IdProd'])
		            ->setCellValue('B'.$i,  $fila['ImaGra'])
        		    ->setCellValue('C'.$i,  $fila['ImaUno'])
					->setCellValue('D'.$i,  $fila['ImaDos'])
					->setCellValue('E'.$i,  $fila['ImaCaj'])
					->setCellValue('F'.$i,  $fila['VidPro'])
					->setCellValue('G'.$i,  utf8_encode($fila['NomPro']))
					->setCellValue('H'.$i,  utf8_encode($fila['CodPro']))
					->setCellValue('I'.$i,  utf8_encode($fila['CarPro']))
					->setCellValue('J'.$i,  utf8_encode($fila['MedPro']))
					->setCellValue('K'.$i,  $fila['PiePro'])
					->setCellValue('L'.$i,  $fila['PreVen'])
					->setCellValue('M'.$i,  $fila['OfePro'])
					->setCellValue('N'.$i,  utf8_encode($fila['EstPro']))
            		->setCellValue('O'.$i,  $fila['NomCat']);
					$i++;
		}
		
		$estiloTituloReporte = array(
        	'font' => array(
	        	'name'      => 'Verdana',
    	        'bold'      => true,
        	    'italic'    => false,
                'strike'    => false,
               	'size' =>16,
	            	'color'     => array(
    	            	'rgb' => 'FFFFFF'
        	       	)
            ),
	        'fill' => array(
				'type'	=> PHPExcel_Style_Fill::FILL_SOLID,
				'color'	=> array('argb' => 'FF220835')
			),
            'borders' => array(
               	'allborders' => array(
                	'style' => PHPExcel_Style_Border::BORDER_NONE                    
               	)
            ), 
            'alignment' =>  array(
        			'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        			'vertical'   => PHPExcel_Style_Alignment::VERTICAL_CENTER,
        			'rotation'   => 0,
        			'wrap'          => TRUE
    		)
        );

		$estiloTituloColumnas = array(
            'font' => array(
                'name'      => 'Arial',
                'bold'      => true,                          
                'color'     => array(
                    'rgb' => 'FFFFFF'
                )
            ),
            'fill' 	=> array(
				'type'		=> PHPExcel_Style_Fill::FILL_GRADIENT_LINEAR,
				'rotation'   => 90,
        		'startcolor' => array(
            		'rgb' => 'c47cf2'
        		),
        		'endcolor'   => array(
            		'argb' => 'FF431a5d'
        		)
			),
            'borders' => array(
            	'top'     => array(
                    'style' => PHPExcel_Style_Border::BORDER_MEDIUM ,
                    'color' => array(
                        'rgb' => '143860'
                    )
                ),
                'bottom'     => array(
                    'style' => PHPExcel_Style_Border::BORDER_MEDIUM ,
                    'color' => array(
                        'rgb' => '143860'
                    )
                )
            ),
			'alignment' =>  array(
        			'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        			'vertical'   => PHPExcel_Style_Alignment::VERTICAL_CENTER,
        			'wrap'          => TRUE
    		));
			
		$estiloInformacion = new PHPExcel_Style();
		$estiloInformacion->applyFromArray(
			array(
           		'font' => array(
               	'name'      => 'Arial',               
               	'color'     => array(
                   	'rgb' => '000000'
               	)
           	),
           	'fill' 	=> array(
				'type'		=> PHPExcel_Style_Fill::FILL_SOLID,
				'color'		=> array('argb' => 'FFd9b7f4')
			),
           	'borders' => array(
               	'left'     => array(
                   	'style' => PHPExcel_Style_Border::BORDER_THIN ,
	                'color' => array(
    	            	'rgb' => '3a2a47'
                   	)
               	)             
           	)
        ));
		 
		$objPHPExcel->getActiveSheet()->getStyle('A1:O1')->applyFromArray($estiloTituloReporte);
		$objPHPExcel->getActiveSheet()->getStyle('A3:O3')->applyFromArray($estiloTituloColumnas);		
		$objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion, "A4:O".($i-1));
				
		for($i = 'A'; $i <= 'O'; $i++){
			$objPHPExcel->setActiveSheetIndex(0)			
				->getColumnDimension($i)->setAutoSize(TRUE);
		}
		
		// Se asigna el nombre a la hoja
		$objPHPExcel->getActiveSheet()->setTitle('Productos');

		// Se activa la hoja para que sea la que se muestre cuando el archivo se abre
		$objPHPExcel->setActiveSheetIndex(0);
		// Inmovilizar paneles 
		//$objPHPExcel->getActiveSheet(0)->freezePane('A4');
		$objPHPExcel->getActiveSheet(0)->freezePaneByColumnAndRow(0,4);

		// Se manda el archivo al navegador web, con el nombre que se indica (Excel2007)
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment;filename="Reportedeproductos.xlsx"');
		header('Cache-Control: max-age=0');

		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter->save('php://output');
		exit;
		
	}
	else{
		print_r('No hay resultados para mostrar');
	}
?>