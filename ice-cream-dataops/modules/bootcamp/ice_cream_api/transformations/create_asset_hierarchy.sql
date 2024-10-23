SELECT
  externalId                      as externalId,
  if(parentExternalId is null,
     '',
     parentExternalId)            as parentExternalId,
  tag                             as name,
  sourceDb                        as source,
  description,
  dataset_id('{{asset_dataset}}')     as dataSetId,
  to_metadata_except(
    array("sourceDb", "parentExternalId", "description"), *)
                                  as metadata
FROM
  `{{asset_raw_input_db}}`.`{{asset_raw_input_table}}`