echo "Uploading log file to S3"
buildkite-agent artifact upload step-types-example/logs.txt s3://screencast-examples/$BUILDKITE_JOB_ID