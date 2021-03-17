Feature: Test polar2grid output images
  This takes test data from source and runs it through the command provided.
  It then compares the new image with the expected output.

  Scenario Outline: Test polar2grid images
    Given input data from <source>
    When <command> runs
    Then the output matches with the files in <output>

  Examples: ACSPO
    | command                                              | source            |  output            |
    | polar2grid.sh -r acspo -w geotiff -vv --grid-coverage=0.0 -f | acspo/input/test1 | acspo/output/test1 |
    | polar2grid.sh -r acspo -w geotiff -vv --grid-coverage=0.0 -f | acspo/input/test2 | acspo/output/test2 |

 Examples: AMSR2_L1B
    | command                                                                  | source            | output             |
    | polar2grid.sh -r amsr2_l1b -w awips_tiled -vv -g 211e -p btemp_36.5h btemp_89.0av -f | amsr2/input/test1 | amsr2/output/test1 |

  Examples: AVHRR
    | command                          | source            | output             |
    | polar2grid.sh -r avhrr -w geotiff -vv -f | avhrr/input/test1 | avhrr/output/test1 |

  Examples: MODIS
    | command                                                                                                                                   | source            | output             |
    | polar2grid.sh -r modis -w geotiff -vv -p true_color false_color --grid-configs ${datapath}/grid_configs/grid_example.conf -g miami -f | modis/input/test1 | modis/output/test1 |

  Examples: VIIRS_L1B
    | command                                                                                                                                                                                           | source                      | output                        |
    | polar2grid.sh -r viirs_l1b -w geotiff -vv --grid-configs /data/dist/p2g_test_data/viirs_l1b_night/input/test1/my_grid.conf -g polar_europe -p adaptive_dnb dynamic_dnb histogram_dnb hncc_dnb -f  | viirs_l1b_night/input/test1 | viirs_l1b_night/output/test1  |

  Examples: VIIRS_SDR
    | command                                                                                      | source                      | output                       |
    | polar2grid.sh -r viirs_sdr -w geotiff -vv --i-bands --m-bands -p adaptive_dnb dynamic_dnb -f | viirs_sdr_day/input/test1   | viirs_sdr_day/output/test1   |
    | polar2grid.sh -r viirs_sdr -w geotiff -vv -f                                                 | viirs_sdr_day/input/test2   | viirs_sdr_day/output/test2   |
    | polar2grid.sh -r viirs_sdr -w geotiff -vv -p adaptive_dnb dynamic_dnb -f                     | viirs_sdr_night/input/test1 | viirs_sdr_night/output/test1 |
    | polar2grid.sh -r viirs_sdr -w geotiff -vv -p true_color false_color --grid-configs ${datapath}/grid_configs/grid_example.conf -g miami -f  | viirs/input/test1 | viirs/output/test1 |
