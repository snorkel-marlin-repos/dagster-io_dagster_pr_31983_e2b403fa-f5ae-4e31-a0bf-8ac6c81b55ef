-- MySQL dump 10.13  Distrib 9.1.0, for macos14 (arm64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('284a732df317');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_check_executions`
--

DROP TABLE IF EXISTS `asset_check_executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_check_executions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `asset_key` text,
  `check_name` text,
  `partition` text,
  `run_id` varchar(255) DEFAULT NULL,
  `execution_status` varchar(255) DEFAULT NULL,
  `evaluation_event` text,
  `evaluation_event_timestamp` datetime(6) DEFAULT NULL,
  `evaluation_event_storage_id` bigint DEFAULT NULL,
  `materialization_event_storage_id` bigint DEFAULT NULL,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_check_executions_unique` (`asset_key`(64),`check_name`(64),`run_id`,`partition`(64)),
  KEY `idx_asset_check_executions` (`asset_key`(64),`check_name`(64),`materialization_event_storage_id`,`partition`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_check_executions`
--

LOCK TABLES `asset_check_executions` WRITE;
/*!40000 ALTER TABLE `asset_check_executions` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_check_executions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_daemon_asset_evaluations`
--

DROP TABLE IF EXISTS `asset_daemon_asset_evaluations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_daemon_asset_evaluations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `evaluation_id` bigint DEFAULT NULL,
  `asset_key` text,
  `asset_evaluation_body` text,
  `num_requested` int DEFAULT NULL,
  `num_skipped` int DEFAULT NULL,
  `num_discarded` int DEFAULT NULL,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_daemon_asset_evaluations_asset_key_evaluation_id` (`asset_key`(64),`evaluation_id`),
  KEY `ix_asset_daemon_asset_evaluations_evaluation_id` (`evaluation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_daemon_asset_evaluations`
--

LOCK TABLES `asset_daemon_asset_evaluations` WRITE;
/*!40000 ALTER TABLE `asset_daemon_asset_evaluations` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_daemon_asset_evaluations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_event_tags`
--

DROP TABLE IF EXISTS `asset_event_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_event_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event_id` bigint DEFAULT NULL,
  `asset_key` text NOT NULL,
  `key` text NOT NULL,
  `value` text,
  `event_timestamp` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_asset_event_tags_event_id` (`event_id`),
  KEY `idx_asset_event_tags` (`asset_key`(64),`key`(64),`value`(64))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_event_tags`
--

LOCK TABLES `asset_event_tags` WRITE;
/*!40000 ALTER TABLE `asset_event_tags` DISABLE KEYS */;
INSERT INTO `asset_event_tags` VALUES (1,14,'[\"not_partitioned\"]','dagster/data_version','2f1b54df025779ce37abfdac7c0370f8467406c8138a2738b88e012384b4a7ce','2024-10-21 18:17:34.094080');
/*!40000 ALTER TABLE `asset_event_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_keys`
--

DROP TABLE IF EXISTS `asset_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_keys` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `asset_key` varchar(512) DEFAULT NULL,
  `last_materialization` longtext,
  `last_run_id` varchar(255) DEFAULT NULL,
  `asset_details` text,
  `wipe_timestamp` timestamp(6) NULL DEFAULT NULL,
  `last_materialization_timestamp` timestamp(6) NULL DEFAULT NULL,
  `tags` text,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `cached_status_data` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_key` (`asset_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_keys`
--

LOCK TABLES `asset_keys` WRITE;
/*!40000 ALTER TABLE `asset_keys` DISABLE KEYS */;
INSERT INTO `asset_keys` VALUES (1,'[\"not_partitioned\"]','{\"__class__\": \"EventLogRecord\", \"event_log_entry\": {\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"StepMaterializationData\", \"asset_lineage\": [], \"materialization\": {\"__class__\": \"AssetMaterialization\", \"asset_key\": {\"__class__\": \"AssetKey\", \"path\": [\"not_partitioned\"]}, \"description\": null, \"metadata_entries\": [{\"__class__\": \"EventMetadataEntry\", \"description\": null, \"entry_data\": {\"__class__\": \"PathMetadataEntryData\", \"path\": \"/Users/jamie/temp_dagster_home/storage/not_partitioned\"}, \"label\": \"path\"}], \"partition\": null, \"tags\": {\"dagster/code_version\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"dagster/data_version\": \"2f1b54df025779ce37abfdac7c0370f8467406c8138a2738b88e012384b4a7ce\"}}}, \"event_type_value\": \"ASSET_MATERIALIZATION\", \"logging_tags\": {\"job_name\": \"__ASSET_JOB\", \"op_name\": \"not_partitioned\", \"resource_fn_name\": \"None\", \"resource_name\": \"None\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\"}, \"message\": \"Materialized value not_partitioned.\", \"pid\": 40638, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}, \"step_handle\": {\"__class__\": \"StepHandle\", \"key\": \"not_partitioned\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}}, \"step_key\": \"not_partitioned\", \"step_kind_value\": \"COMPUTE\"}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520254.09408, \"user_message\": \"Materialized value not_partitioned.\"}, \"storage_id\": 14}','c18f0585-c495-415f-8f2c-4a446e92a05a',NULL,NULL,'2024-10-21 18:17:34.094080',NULL,'2024-10-21 10:17:29.507021',NULL);
/*!40000 ALTER TABLE `asset_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_actions`
--

DROP TABLE IF EXISTS `bulk_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulk_actions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp(6) NOT NULL,
  `body` text,
  `action_type` varchar(32) DEFAULT NULL,
  `selector_id` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `idx_bulk_actions_status` (`status`(32)),
  KEY `idx_bulk_actions_action_type` (`action_type`),
  KEY `idx_bulk_actions_selector_id` (`selector_id`(64)),
  KEY `idx_bulk_actions` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_actions`
--

LOCK TABLES `bulk_actions` WRITE;
/*!40000 ALTER TABLE `bulk_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concurrency_limits`
--

DROP TABLE IF EXISTS `concurrency_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concurrency_limits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `concurrency_key` varchar(512) NOT NULL,
  `limit` int NOT NULL,
  `update_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `concurrency_key` (`concurrency_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concurrency_limits`
--

LOCK TABLES `concurrency_limits` WRITE;
/*!40000 ALTER TABLE `concurrency_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `concurrency_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concurrency_slots`
--

DROP TABLE IF EXISTS `concurrency_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concurrency_slots` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `concurrency_key` text NOT NULL,
  `run_id` text,
  `step_key` text,
  `deleted` tinyint(1) NOT NULL,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concurrency_slots`
--

LOCK TABLES `concurrency_slots` WRITE;
/*!40000 ALTER TABLE `concurrency_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `concurrency_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daemon_heartbeats`
--

DROP TABLE IF EXISTS `daemon_heartbeats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daemon_heartbeats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `daemon_type` varchar(255) NOT NULL,
  `daemon_id` varchar(255) DEFAULT NULL,
  `timestamp` timestamp(6) NOT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `daemon_type` (`daemon_type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemon_heartbeats`
--

LOCK TABLES `daemon_heartbeats` WRITE;
/*!40000 ALTER TABLE `daemon_heartbeats` DISABLE KEYS */;
INSERT INTO `daemon_heartbeats` VALUES (1,'SENSOR','520ae364-0f49-47de-9435-d1b7b544651b','2024-10-21 18:17:55.763635','{\"__class__\": \"DaemonHeartbeat\", \"daemon_id\": \"520ae364-0f49-47de-9435-d1b7b544651b\", \"daemon_type\": \"SENSOR\", \"errors\": [], \"timestamp\": 1729520275.763635}'),(2,'ASSET','520ae364-0f49-47de-9435-d1b7b544651b','2024-10-21 18:17:55.765283','{\"__class__\": \"DaemonHeartbeat\", \"daemon_id\": \"520ae364-0f49-47de-9435-d1b7b544651b\", \"daemon_type\": \"ASSET\", \"errors\": [], \"timestamp\": 1729520275.765283}'),(3,'BACKFILL','520ae364-0f49-47de-9435-d1b7b544651b','2024-10-21 18:17:56.514416','{\"__class__\": \"DaemonHeartbeat\", \"daemon_id\": \"520ae364-0f49-47de-9435-d1b7b544651b\", \"daemon_type\": \"BACKFILL\", \"errors\": [], \"timestamp\": 1729520276.514416}'),(4,'SCHEDULER','520ae364-0f49-47de-9435-d1b7b544651b','2024-10-21 18:18:00.001298','{\"__class__\": \"DaemonHeartbeat\", \"daemon_id\": \"520ae364-0f49-47de-9435-d1b7b544651b\", \"daemon_type\": \"SCHEDULER\", \"errors\": [], \"timestamp\": 1729520280.001298}');
/*!40000 ALTER TABLE `daemon_heartbeats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_partitions`
--

DROP TABLE IF EXISTS `dynamic_partitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_partitions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `partitions_def_name` text NOT NULL,
  `partition` text NOT NULL,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dynamic_partitions` (`partitions_def_name`(64),`partition`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_partitions`
--

LOCK TABLES `dynamic_partitions` WRITE;
/*!40000 ALTER TABLE `dynamic_partitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_partitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_logs`
--

DROP TABLE IF EXISTS `event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_id` varchar(255) DEFAULT NULL,
  `event` longtext NOT NULL,
  `dagster_event_type` text,
  `timestamp` timestamp(6) NULL DEFAULT NULL,
  `step_key` text,
  `asset_key` text,
  `partition` text,
  PRIMARY KEY (`id`),
  KEY `idx_events_by_asset_partition` (`asset_key`(64),`dagster_event_type`(64),`partition`(64),`id`),
  KEY `idx_events_by_run_id` (`run_id`(64),`id`),
  KEY `idx_event_type` (`dagster_event_type`(64),`id`),
  KEY `idx_events_by_asset` (`asset_key`(64),`dagster_event_type`(64),`id`),
  KEY `idx_step_key` (`step_key`(32))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_logs`
--

LOCK TABLES `event_logs` WRITE;
/*!40000 ALTER TABLE `event_logs` DISABLE KEYS */;
INSERT INTO `event_logs` VALUES (1,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"AssetMaterializationPlannedData\", \"asset_key\": {\"__class__\": \"AssetKey\", \"path\": [\"not_partitioned\"]}, \"partition\": null, \"partitions_subset\": null}, \"event_type_value\": \"ASSET_MATERIALIZATION_PLANNED\", \"logging_tags\": {}, \"message\": \"__ASSET_JOB intends to materialize asset [\\\"not_partitioned\\\"]\", \"pid\": null, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": null, \"step_key\": \"not_partitioned\", \"step_kind_value\": null}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520249.504714, \"user_message\": \"\"}','ASSET_MATERIALIZATION_PLANNED','2024-10-21 18:17:29.504714','not_partitioned','[\"not_partitioned\"]',NULL),(2,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": null, \"event_type_value\": \"PIPELINE_STARTING\", \"logging_tags\": {}, \"message\": null, \"pid\": null, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": null, \"step_key\": null, \"step_kind_value\": null}, \"error_info\": null, \"level\": 20, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": null, \"timestamp\": 1729520249.513546, \"user_message\": \"\"}','PIPELINE_STARTING','2024-10-21 18:17:29.513546',NULL,NULL,NULL),(3,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"EngineEventData\", \"error\": null, \"marker_end\": null, \"marker_start\": null, \"metadata_entries\": [{\"__class__\": \"EventMetadataEntry\", \"description\": null, \"entry_data\": {\"__class__\": \"TextMetadataEntryData\", \"text\": \"40632\"}, \"label\": \"pid\"}]}, \"event_type_value\": \"ENGINE_EVENT\", \"logging_tags\": {}, \"message\": \"Started process for run (pid: 40632).\", \"pid\": null, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": null, \"step_key\": null, \"step_kind_value\": null}, \"error_info\": null, \"level\": 20, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": null, \"timestamp\": 1729520252.595465, \"user_message\": \"\"}','ENGINE_EVENT','2024-10-21 18:17:32.595465',NULL,NULL,NULL),(4,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": null, \"event_type_value\": \"PIPELINE_START\", \"logging_tags\": {}, \"message\": \"Started execution of run for \\\"__ASSET_JOB\\\".\", \"pid\": 40632, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": null, \"step_key\": null, \"step_kind_value\": null}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": null, \"timestamp\": 1729520252.673173, \"user_message\": \"Started execution of run for \\\"__ASSET_JOB\\\".\"}','PIPELINE_START','2024-10-21 18:17:32.673173',NULL,NULL,NULL),(5,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"EngineEventData\", \"error\": null, \"marker_end\": null, \"marker_start\": null, \"metadata_entries\": [{\"__class__\": \"EventMetadataEntry\", \"description\": null, \"entry_data\": {\"__class__\": \"TextMetadataEntryData\", \"text\": \"40632\"}, \"label\": \"pid\"}, {\"__class__\": \"EventMetadataEntry\", \"description\": null, \"entry_data\": {\"__class__\": \"TextMetadataEntryData\", \"text\": \"[\'not_partitioned\']\"}, \"label\": \"step_keys\"}]}, \"event_type_value\": \"ENGINE_EVENT\", \"logging_tags\": {}, \"message\": \"Executing steps using multiprocess executor: parent process (pid: 40632)\", \"pid\": 40632, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": null, \"step_key\": null, \"step_kind_value\": null}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": null, \"timestamp\": 1729520252.7089531, \"user_message\": \"Executing steps using multiprocess executor: parent process (pid: 40632)\"}','ENGINE_EVENT','2024-10-21 18:17:32.708953',NULL,NULL,NULL),(6,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"EngineEventData\", \"error\": null, \"marker_end\": null, \"marker_start\": \"step_process_start\", \"metadata_entries\": []}, \"event_type_value\": \"STEP_WORKER_STARTING\", \"logging_tags\": {\"job_name\": \"__ASSET_JOB\", \"op_name\": \"not_partitioned\", \"resource_fn_name\": \"None\", \"resource_name\": \"None\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\"}, \"message\": \"Launching subprocess for \\\"not_partitioned\\\".\", \"pid\": 40632, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}, \"step_handle\": {\"__class__\": \"StepHandle\", \"key\": \"not_partitioned\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}}, \"step_key\": \"not_partitioned\", \"step_kind_value\": \"COMPUTE\"}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520252.718335, \"user_message\": \"Launching subprocess for \\\"not_partitioned\\\".\"}','STEP_WORKER_STARTING','2024-10-21 18:17:32.718335','not_partitioned',NULL,NULL),(7,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"EngineEventData\", \"error\": null, \"marker_end\": \"step_process_start\", \"marker_start\": null, \"metadata_entries\": [{\"__class__\": \"EventMetadataEntry\", \"description\": null, \"entry_data\": {\"__class__\": \"TextMetadataEntryData\", \"text\": \"40638\"}, \"label\": \"pid\"}]}, \"event_type_value\": \"STEP_WORKER_STARTED\", \"logging_tags\": {}, \"message\": \"Executing step \\\"not_partitioned\\\" in subprocess.\", \"pid\": 40638, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": null, \"step_key\": \"not_partitioned\", \"step_kind_value\": null}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520253.902018, \"user_message\": \"Executing step \\\"not_partitioned\\\" in subprocess.\"}','STEP_WORKER_STARTED','2024-10-21 18:17:33.902018','not_partitioned',NULL,NULL),(8,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"EngineEventData\", \"error\": null, \"marker_end\": null, \"marker_start\": \"resources\", \"metadata_entries\": []}, \"event_type_value\": \"RESOURCE_INIT_STARTED\", \"logging_tags\": {}, \"message\": \"Starting initialization of resources [io_manager].\", \"pid\": 40638, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": {\"__class__\": \"StepHandle\", \"key\": \"not_partitioned\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}}, \"step_key\": \"not_partitioned\", \"step_kind_value\": null}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520253.939075, \"user_message\": \"Starting initialization of resources [io_manager].\"}','RESOURCE_INIT_STARTED','2024-10-21 18:17:33.939075','not_partitioned',NULL,NULL),(9,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"EngineEventData\", \"error\": null, \"marker_end\": \"resources\", \"marker_start\": null, \"metadata_entries\": [{\"__class__\": \"EventMetadataEntry\", \"description\": null, \"entry_data\": {\"__class__\": \"PythonArtifactMetadataEntryData\", \"module\": \"dagster._core.storage.fs_io_manager\", \"name\": \"PickledObjectFilesystemIOManager\"}, \"label\": \"io_manager\"}, {\"__class__\": \"EventMetadataEntry\", \"description\": null, \"entry_data\": {\"__class__\": \"TextMetadataEntryData\", \"text\": \"32ms\"}, \"label\": \"io_manager:init_time\"}]}, \"event_type_value\": \"RESOURCE_INIT_SUCCESS\", \"logging_tags\": {}, \"message\": \"Finished initialization of resources [io_manager].\", \"pid\": 40638, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": {\"__class__\": \"StepHandle\", \"key\": \"not_partitioned\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}}, \"step_key\": \"not_partitioned\", \"step_kind_value\": null}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520253.98586, \"user_message\": \"Finished initialization of resources [io_manager].\"}','RESOURCE_INIT_SUCCESS','2024-10-21 18:17:33.985860','not_partitioned',NULL,NULL),(10,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"ComputeLogsCaptureData\", \"external_stderr_url\": null, \"external_stdout_url\": null, \"external_url\": null, \"log_key\": \"uvuunmkd\", \"step_keys\": [\"not_partitioned\"]}, \"event_type_value\": \"LOGS_CAPTURED\", \"logging_tags\": {}, \"message\": \"Started capturing logs in process (pid: 40638).\", \"pid\": 40638, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": null, \"step_key\": null, \"step_kind_value\": null}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": null, \"timestamp\": 1729520254.0351481, \"user_message\": \"Started capturing logs in process (pid: 40638).\"}','LOGS_CAPTURED','2024-10-21 18:17:34.035148',NULL,NULL,NULL),(11,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": null, \"event_type_value\": \"STEP_START\", \"logging_tags\": {\"job_name\": \"__ASSET_JOB\", \"op_name\": \"not_partitioned\", \"resource_fn_name\": \"None\", \"resource_name\": \"None\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\"}, \"message\": \"Started execution of step \\\"not_partitioned\\\".\", \"pid\": 40638, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}, \"step_handle\": {\"__class__\": \"StepHandle\", \"key\": \"not_partitioned\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}}, \"step_key\": \"not_partitioned\", \"step_kind_value\": \"COMPUTE\"}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520254.05652, \"user_message\": \"Started execution of step \\\"not_partitioned\\\".\"}','STEP_START','2024-10-21 18:17:34.056520','not_partitioned',NULL,NULL),(12,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"StepOutputData\", \"metadata_entries\": [], \"step_output_handle\": {\"__class__\": \"StepOutputHandle\", \"mapping_key\": null, \"output_name\": \"result\", \"step_key\": \"not_partitioned\"}, \"type_check_data\": {\"__class__\": \"TypeCheckData\", \"description\": null, \"label\": \"result\", \"metadata_entries\": [], \"success\": true}, \"version\": null}, \"event_type_value\": \"STEP_OUTPUT\", \"logging_tags\": {\"job_name\": \"__ASSET_JOB\", \"op_name\": \"not_partitioned\", \"resource_fn_name\": \"None\", \"resource_name\": \"None\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\"}, \"message\": \"Yielded output \\\"result\\\" of type \\\"Any\\\". (Type check passed).\", \"pid\": 40638, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}, \"step_handle\": {\"__class__\": \"StepHandle\", \"key\": \"not_partitioned\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}}, \"step_key\": \"not_partitioned\", \"step_kind_value\": \"COMPUTE\"}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520254.069696, \"user_message\": \"Yielded output \\\"result\\\" of type \\\"Any\\\". (Type check passed).\"}','STEP_OUTPUT','2024-10-21 18:17:34.069696','not_partitioned',NULL,NULL),(13,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": null, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520254.084224, \"user_message\": \"Writing file at: /Users/jamie/temp_dagster_home/storage/not_partitioned using PickledObjectFilesystemIOManager...\"}',NULL,'2024-10-21 18:17:34.084224','not_partitioned',NULL,NULL),(14,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"StepMaterializationData\", \"asset_lineage\": [], \"materialization\": {\"__class__\": \"AssetMaterialization\", \"asset_key\": {\"__class__\": \"AssetKey\", \"path\": [\"not_partitioned\"]}, \"description\": null, \"metadata_entries\": [{\"__class__\": \"EventMetadataEntry\", \"description\": null, \"entry_data\": {\"__class__\": \"PathMetadataEntryData\", \"path\": \"/Users/jamie/temp_dagster_home/storage/not_partitioned\"}, \"label\": \"path\"}], \"partition\": null, \"tags\": {\"dagster/code_version\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"dagster/data_version\": \"2f1b54df025779ce37abfdac7c0370f8467406c8138a2738b88e012384b4a7ce\"}}}, \"event_type_value\": \"ASSET_MATERIALIZATION\", \"logging_tags\": {\"job_name\": \"__ASSET_JOB\", \"op_name\": \"not_partitioned\", \"resource_fn_name\": \"None\", \"resource_name\": \"None\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\"}, \"message\": \"Materialized value not_partitioned.\", \"pid\": 40638, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}, \"step_handle\": {\"__class__\": \"StepHandle\", \"key\": \"not_partitioned\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}}, \"step_key\": \"not_partitioned\", \"step_kind_value\": \"COMPUTE\"}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520254.09408, \"user_message\": \"Materialized value not_partitioned.\"}','ASSET_MATERIALIZATION','2024-10-21 18:17:34.094080','not_partitioned','[\"not_partitioned\"]',NULL),(15,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"HandledOutputData\", \"manager_key\": \"io_manager\", \"metadata_entries\": [{\"__class__\": \"EventMetadataEntry\", \"description\": null, \"entry_data\": {\"__class__\": \"PathMetadataEntryData\", \"path\": \"/Users/jamie/temp_dagster_home/storage/not_partitioned\"}, \"label\": \"path\"}], \"output_name\": \"result\"}, \"event_type_value\": \"HANDLED_OUTPUT\", \"logging_tags\": {\"job_name\": \"__ASSET_JOB\", \"op_name\": \"not_partitioned\", \"resource_fn_name\": \"None\", \"resource_name\": \"None\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\"}, \"message\": \"Handled output \\\"result\\\" using IO manager \\\"io_manager\\\"\", \"pid\": 40638, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}, \"step_handle\": {\"__class__\": \"StepHandle\", \"key\": \"not_partitioned\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}}, \"step_key\": \"not_partitioned\", \"step_kind_value\": \"COMPUTE\"}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520254.148461, \"user_message\": \"Handled output \\\"result\\\" using IO manager \\\"io_manager\\\"\"}','HANDLED_OUTPUT','2024-10-21 18:17:34.148461','not_partitioned',NULL,NULL),(16,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"StepSuccessData\", \"duration_ms\": 94.62320798775181}, \"event_type_value\": \"STEP_SUCCESS\", \"logging_tags\": {\"job_name\": \"__ASSET_JOB\", \"op_name\": \"not_partitioned\", \"resource_fn_name\": \"None\", \"resource_name\": \"None\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\"}, \"message\": \"Finished execution of step \\\"not_partitioned\\\" in 94ms.\", \"pid\": 40638, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}, \"step_handle\": {\"__class__\": \"StepHandle\", \"key\": \"not_partitioned\", \"solid_handle\": {\"__class__\": \"SolidHandle\", \"name\": \"not_partitioned\", \"parent\": null}}, \"step_key\": \"not_partitioned\", \"step_kind_value\": \"COMPUTE\"}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": \"not_partitioned\", \"timestamp\": 1729520254.162733, \"user_message\": \"Finished execution of step \\\"not_partitioned\\\" in 94ms.\"}','STEP_SUCCESS','2024-10-21 18:17:34.162733','not_partitioned',NULL,NULL),(17,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"EngineEventData\", \"error\": null, \"marker_end\": null, \"marker_start\": null, \"metadata_entries\": [{\"__class__\": \"EventMetadataEntry\", \"description\": null, \"entry_data\": {\"__class__\": \"TextMetadataEntryData\", \"text\": \"40632\"}, \"label\": \"pid\"}]}, \"event_type_value\": \"ENGINE_EVENT\", \"logging_tags\": {}, \"message\": \"Multiprocess executor: parent process exiting after 1.67s (pid: 40632)\", \"pid\": 40632, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": null, \"step_key\": null, \"step_kind_value\": null}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": null, \"timestamp\": 1729520254.388716, \"user_message\": \"Multiprocess executor: parent process exiting after 1.67s (pid: 40632)\"}','ENGINE_EVENT','2024-10-21 18:17:34.388716',NULL,NULL,NULL),(18,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": null, \"event_type_value\": \"PIPELINE_SUCCESS\", \"logging_tags\": {}, \"message\": \"Finished execution of run for \\\"__ASSET_JOB\\\".\", \"pid\": 40632, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": null, \"step_key\": null, \"step_kind_value\": null}, \"error_info\": null, \"level\": 10, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": null, \"timestamp\": 1729520254.402448, \"user_message\": \"Finished execution of run for \\\"__ASSET_JOB\\\".\"}','PIPELINE_SUCCESS','2024-10-21 18:17:34.402448',NULL,NULL,NULL),(19,'c18f0585-c495-415f-8f2c-4a446e92a05a','{\"__class__\": \"EventLogEntry\", \"dagster_event\": {\"__class__\": \"DagsterEvent\", \"event_specific_data\": {\"__class__\": \"EngineEventData\", \"error\": null, \"marker_end\": null, \"marker_start\": null, \"metadata_entries\": []}, \"event_type_value\": \"ENGINE_EVENT\", \"logging_tags\": {}, \"message\": \"Process for run exited (pid: 40632).\", \"pid\": null, \"pipeline_name\": \"__ASSET_JOB\", \"solid_handle\": null, \"step_handle\": null, \"step_key\": null, \"step_kind_value\": null}, \"error_info\": null, \"level\": 20, \"message\": \"\", \"pipeline_name\": \"__ASSET_JOB\", \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"step_key\": null, \"timestamp\": 1729520254.452232, \"user_message\": \"\"}','ENGINE_EVENT','2024-10-21 18:17:34.452232',NULL,NULL,NULL);
/*!40000 ALTER TABLE `event_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_info`
--

DROP TABLE IF EXISTS `instance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_storage_id` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_info`
--

LOCK TABLES `instance_info` WRITE;
/*!40000 ALTER TABLE `instance_info` DISABLE KEYS */;
INSERT INTO `instance_info` VALUES (1,'9c50caea-e992-4d42-8e6d-781df0cdf237');
/*!40000 ALTER TABLE `instance_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instigators`
--

DROP TABLE IF EXISTS `instigators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instigators` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `selector_id` varchar(255) DEFAULT NULL,
  `repository_selector_id` varchar(255) DEFAULT NULL,
  `status` varchar(63) DEFAULT NULL,
  `instigator_type` varchar(63) DEFAULT NULL,
  `instigator_body` text,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `update_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector_id` (`selector_id`),
  KEY `ix_instigators_instigator_type` (`instigator_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instigators`
--

LOCK TABLES `instigators` WRITE;
/*!40000 ALTER TABLE `instigators` DISABLE KEYS */;
/*!40000 ALTER TABLE `instigators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_ticks`
--

DROP TABLE IF EXISTS `job_ticks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_ticks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_origin_id` varchar(255) DEFAULT NULL,
  `selector_id` varchar(255) DEFAULT NULL,
  `status` varchar(63) DEFAULT NULL,
  `type` varchar(63) DEFAULT NULL,
  `timestamp` timestamp(6) NULL DEFAULT NULL,
  `tick_body` text,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `update_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `ix_job_ticks_job_origin_id` (`job_origin_id`),
  KEY `idx_job_tick_status` (`job_origin_id`(32),`status`(32)),
  KEY `idx_job_tick_timestamp` (`job_origin_id`,`timestamp`),
  KEY `idx_tick_selector_timestamp` (`selector_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_ticks`
--

LOCK TABLES `job_ticks` WRITE;
/*!40000 ALTER TABLE `job_ticks` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_ticks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_origin_id` varchar(255) DEFAULT NULL,
  `selector_id` varchar(255) DEFAULT NULL,
  `repository_origin_id` varchar(255) DEFAULT NULL,
  `status` varchar(63) DEFAULT NULL,
  `job_type` varchar(63) DEFAULT NULL,
  `job_body` text,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `update_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_origin_id` (`job_origin_id`),
  KEY `ix_jobs_job_type` (`job_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kvs`
--

DROP TABLE IF EXISTS `kvs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` text NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kvs_keys_unique` (`key`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kvs`
--

LOCK TABLES `kvs` WRITE;
/*!40000 ALTER TABLE `kvs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kvs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_steps`
--

DROP TABLE IF EXISTS `pending_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pending_steps` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `concurrency_key` text NOT NULL,
  `run_id` text,
  `step_key` text,
  `priority` int DEFAULT NULL,
  `assigned_timestamp` datetime(6) DEFAULT NULL,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pending_steps` (`concurrency_key`(255),`run_id`(255),`step_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_steps`
--

LOCK TABLES `pending_steps` WRITE;
/*!40000 ALTER TABLE `pending_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run_tags`
--

DROP TABLE IF EXISTS `run_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `run_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_id` varchar(255) DEFAULT NULL,
  `key` text,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `run_id` (`run_id`),
  KEY `idx_run_tags` (`key`(64),`value`(64)),
  KEY `idx_run_tags_run_idx` (`run_id`,`id`),
  CONSTRAINT `run_tags_ibfk_1` FOREIGN KEY (`run_id`) REFERENCES `runs` (`run_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run_tags`
--

LOCK TABLES `run_tags` WRITE;
/*!40000 ALTER TABLE `run_tags` DISABLE KEYS */;
INSERT INTO `run_tags` VALUES (1,'c18f0585-c495-415f-8f2c-4a446e92a05a','.dagster/repository','__repository__@backfill_multiple_iterations.py'),(2,'c18f0585-c495-415f-8f2c-4a446e92a05a','.dagster/grpc_info','{\"host\": \"localhost\", \"socket\": \"/var/folders/ns/r7rp0cg558zdj1yjm3p66qn80000gn/T/tmpu8pljpug\"}');
/*!40000 ALTER TABLE `run_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runs`
--

DROP TABLE IF EXISTS `runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `runs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_id` varchar(255) DEFAULT NULL,
  `snapshot_id` varchar(255) DEFAULT NULL,
  `pipeline_name` text,
  `mode` text,
  `status` varchar(63) DEFAULT NULL,
  `run_body` text,
  `partition` text,
  `partition_set` text,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `update_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `start_time` double DEFAULT NULL,
  `end_time` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `run_id` (`run_id`),
  KEY `fk_runs_snapshot_id_snapshots_snapshot_id` (`snapshot_id`),
  KEY `idx_run_partitions` (`partition_set`(64),`partition`(64)),
  KEY `idx_run_status` (`status`(32)),
  KEY `idx_run_range` (`status`(32),`update_timestamp`,`create_timestamp`),
  KEY `idx_runs_by_job` (`pipeline_name`(255),`id`),
  CONSTRAINT `fk_runs_snapshot_id_snapshots_snapshot_id` FOREIGN KEY (`snapshot_id`) REFERENCES `snapshots` (`snapshot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runs`
--

LOCK TABLES `runs` WRITE;
/*!40000 ALTER TABLE `runs` DISABLE KEYS */;
INSERT INTO `runs` VALUES (1,'c18f0585-c495-415f-8f2c-4a446e92a05a','dd6c6dd475cd4d91c23a9dbaf55eb56b2b1d0d25','__ASSET_JOB',NULL,'SUCCESS','{\"__class__\": \"PipelineRun\", \"asset_check_selection\": {\"__frozenset__\": []}, \"asset_selection\": {\"__frozenset__\": [{\"__class__\": \"AssetKey\", \"path\": [\"not_partitioned\"]}]}, \"execution_plan_snapshot_id\": \"93b84fd7cd172f878122450c2dae6901be99048f\", \"external_pipeline_origin\": {\"__class__\": \"ExternalPipelineOrigin\", \"external_repository_origin\": {\"__class__\": \"ExternalRepositoryOrigin\", \"repository_location_origin\": {\"__class__\": \"ManagedGrpcPythonEnvRepositoryLocationOrigin\", \"loadable_target_origin\": {\"__class__\": \"LoadableTargetOrigin\", \"attribute\": null, \"executable_path\": null, \"module_name\": null, \"package_name\": null, \"python_file\": \"../jamie_examples/backfill_multiple_iterations.py\", \"working_directory\": \"/Users/jamie/dev/dagster\"}, \"location_name\": \"backfill_multiple_iterations.py\"}, \"repository_name\": \"__repository__\"}, \"pipeline_name\": \"__ASSET_JOB\"}, \"has_repository_load_data\": false, \"mode\": null, \"parent_run_id\": null, \"pipeline_code_origin\": {\"__class__\": \"PipelinePythonOrigin\", \"pipeline_name\": \"__ASSET_JOB\", \"repository_origin\": {\"__class__\": \"RepositoryPythonOrigin\", \"code_pointer\": {\"__class__\": \"FileCodePointer\", \"fn_name\": \"defs\", \"python_file\": \"../jamie_examples/backfill_multiple_iterations.py\", \"working_directory\": \"/Users/jamie/dev/dagster\"}, \"container_context\": {}, \"container_image\": null, \"entry_point\": [\"dagster\"], \"executable_path\": \"/Users/jamie/.pyenv/versions/3.11.1/envs/dagster-3.11/bin/python3\"}}, \"pipeline_name\": \"__ASSET_JOB\", \"pipeline_snapshot_id\": \"dd6c6dd475cd4d91c23a9dbaf55eb56b2b1d0d25\", \"root_run_id\": null, \"run_config\": {}, \"run_id\": \"c18f0585-c495-415f-8f2c-4a446e92a05a\", \"run_op_concurrency\": null, \"solid_selection\": null, \"solids_to_execute\": null, \"status\": {\"__enum__\": \"PipelineRunStatus.SUCCESS\"}, \"step_keys_to_execute\": [\"not_partitioned\"], \"tags\": {\".dagster/grpc_info\": \"{\\\"host\\\": \\\"localhost\\\", \\\"socket\\\": \\\"/var/folders/ns/r7rp0cg558zdj1yjm3p66qn80000gn/T/tmpu8pljpug\\\"}\"}}',NULL,NULL,'2024-10-21 10:17:29.501248','2024-10-21 14:17:34.438747',1729520252.697955,1729520254.438747);
/*!40000 ALTER TABLE `runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondary_indexes`
--

DROP TABLE IF EXISTS `secondary_indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secondary_indexes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `create_timestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `migration_completed` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondary_indexes`
--

LOCK TABLES `secondary_indexes` WRITE;
/*!40000 ALTER TABLE `secondary_indexes` DISABLE KEYS */;
INSERT INTO `secondary_indexes` VALUES (1,'run_partitions','2024-10-21 10:16:51.999764','2024-10-21 10:16:51.972696'),(2,'run_repo_label_tags','2024-10-21 10:16:52.247391','2024-10-21 10:16:52.145128'),(3,'bulk_action_types','2024-10-21 10:16:52.333973','2024-10-21 10:16:52.322206'),(4,'run_start_end_overwritten','2024-10-21 10:16:52.394137','2024-10-21 10:16:52.382596'),(5,'asset_key_table','2024-10-21 10:16:52.565227','2024-10-21 10:16:52.559331'),(6,'asset_key_index_columns','2024-10-21 10:16:52.586322','2024-10-21 10:16:52.580242'),(7,'schedule_jobs_selector_id','2024-10-21 10:16:52.686899','2024-10-21 10:16:52.682249'),(8,'schedule_ticks_selector_id','2024-10-21 10:16:52.727521','2024-10-21 10:16:52.722314');
/*!40000 ALTER TABLE `secondary_indexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshots`
--

DROP TABLE IF EXISTS `snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snapshots` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `snapshot_id` varchar(255) NOT NULL,
  `snapshot_body` blob NOT NULL,
  `snapshot_type` varchar(63) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `snapshot_id` (`snapshot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshots`
--

LOCK TABLES `snapshots` WRITE;
/*!40000 ALTER TABLE `snapshots` DISABLE KEYS */;
INSERT INTO `snapshots` VALUES (1,'653890b7bc24ce4415c9f2704bf15f80c2bb8f65',_binary 'x�\�][s۸�+\��\�\�\�\�ľ9�\�u\�ڙ\�\�Ng�ap�إH.I9Qw�\�{\0R%�2$K�\�\�\�lR\���w�8\0\�\�QD\\�Q4�\�|�s�\�)�Lq^�j\��1�Y*⛨�C>\�Q9�\�G\�\�\�g߫v��Y�y�$є���I\�+�(\�餏\�\�$WlH����\�*\�Rh���n\�t<�nq2\�\����y\�Z\�7\�-O����,���uﳫ8e\r�\������\��3���%\�	.�摦�\nZE9.\�H�kڹl~\\xrt9\�9?2�\�i��b�,@��>&|J|�!\�\0�l}<gqY�06\�n#$�{S 7\�W�ϟ�\�\������|iI�*\�\�\�\��\�l\��]!Vw��x�e\�l6ں��xg�\Z\�||v��c�]O]�\�wg\�~���d�\�\�m���9\n\�\�\�\�\�\�\��\�N\�=� ;�c0�\�!�\���<K9&	?\���\�ԢX`B�\�\�\�wg\'\�ف\�5H?�0�#i�o.y\�i�G�{̳B\� �\�u�\'l\�)�RK�4,�x\�\�\�\�\�k�]\�\��\�\��z8O�\���ݓ�r\�12\�\�N��\��P$|D�o#P{\�\�V\�s�:!�My߹|f�w}\�\�	lj>D��\n,f٘\��\�6Cӡa���k\�l\� ĳ\�;N\�\�\�\�h\�g>Fn��\�P\���\�Ķl\�w�ض\�T�����mc\�w.�y��>s�2R)�\�2&B�m⺡K1�\�4�m#nv\�C\�����a>�q�O\�\�Y-��D-\"�\��cd��� ��L\ZX��\�\�83��#Q�\�I\���yNU\�qREy�\�ƌKX�b\�[�(\�.���Y\Z�U!)�~\�\�R\\F�m���I)�M\�W�2KS[�T\'\�;;�{\�\'.1�c{\\ \�7��X0�-&�\�<��\�t+C�\�\���\\�\�rrv\��\�k�\�`	gƔ\��i!aaφqy�,ӱ-\�\�\�\�\�~ \�\�4~*\�Uj\�\�����͵\�\��F\�\�E[\�ڠ\�SҾ\��@�\�\�!�:��y\�\����6A\�<(Ik\��\��\� !^^Kޯ�v��\�\�:�\�\�\�;�\�8I��\�yiĩ����p���,�z�8��\�\�N\�u�\�b\�y��� m㡋a\�� \�&g�c۞Ew\��#�]�\�(xZ]\�ĳ9rӡ�N!�,�\�8Y�\����#r\�,K�\�v=$\�8~\�[��-L,\�ᅵ\�`��:V(<,@3�\�{4�	���\'C�\�3>?\�\�ҡ���\�F5\�F[	�\�++�*\�\�Ee�c\��\�Kc,-\��*�\�ג�����e\�\�=FJ`�\�\�d±l\�\�\�_�Cj��),j\�L\�\�{\�x�\�Ku0R\r\��ik�>M\����I\Z�\��kqm\'��4\�	ǷB�Q�(A~\�s{c�\�\�\���\�82Ely`���m�[/�m\�4��:�j����\�T+&ڶ�\���m\�\�/ͼ\�\�m\�\�6\�\�2m\�\��2\�6�\�~^�\�\�8wc�\�d����\r\��\�>��&��\�P�<�\�>lZ6q\�\���\�_�󹍬\�:\�dm\�Զ�}�f�\�6�\�\�}� \�P�,JB\�xa\�;Ȳ�:\�\�R�\�x=8=�xq=\�4^\r��d77��siTÂ�\�,a\Z�Cx(J�-O�\\\�k�\��oʊ�C�\\\�\r̓l\\4\�\���{È��\�\�\�\�\�\�\�W\�\�Oǟ\�\����\�;۪�\\\�\�v\�v�\�&\�(�:\�{�\�ugn�\�K�i�[>��%<t<��\�smL��N	#�d\�E��\�5טg�@�OC�\\b�R�\�\�\�u\�b�\�\�M͒�\n�N\�,\����>�՝ii{eM\rӕ\�^5\�\n�@�;$8��GM&LoL\�0C��\�P\�6\�\�Ӭ\Z\�\"\ZB�L�l\�\�9\�\Z��u� �cǣ\�v=�\"2\�;���J\\\0\�\��a\�fK�\�&*\�iڷ\����R�z_\�\�M{\�{���\�\�KVR9\�m\Z���\�\���\�\����XX\\0\�\�����=!\�\�<D�G ߱\�S\�6c$��\��/�(^�\�P.��+w]�\�*\�\'\�\�r_�\�\�<O&grr\�˩�oc��͗Kws2a+�\�\��\"D?�\�\�ɧ\�\'N>|\�\���_!M�2`1+{0�\�(���c�\�\�!�٤\�\�5p��\�!#+\�R��w�\�D懮v\ZӘ\�{�}�@\�Z�\�r\�ւ\�\�\�8c\�\�|p\��m���e\�G9(k\�i\��jv�\�\�UB����\�b\�!�\�n��p5|T�Z\�}ZoO\��\�\�\�{�\�4���Q\�\�bR\��\�\�8�\�QeF^\�$\�L����\�\��2 }�e\�\�_\\Ś\�[fP,��C\�Y]���i\��V\�m\�\�8��u�\��oF�o�4d\�\�D��\�<�z4J�\�R\�0�\�Ib>巡=\�M�6%��\�\�q\�j�p`l\�F\r�\�V\�/�\�\�=M۫�kπ_��?\"�i�5�\�^z!s]H\�<991\�\Z��4�\�Y��\�\�?��L\�k���O�Lomv*�3/��fߚ3}*\�ϫ1pL\�P\�+Ʃ������\��P;�mRc�CW�\�\�1CN!�Ox6%<\�n	�z\�48L��@�o�鯉EC�	\"�!�s��\\��a���\�\�$0C$L\�\"�\�[W��\��P�\���\�RIy�\�R!v\���\�Z\� �\����\�((��\�蜕�\�=��nus\���h�SЯ�1ۖ�k\�\�\�%����\�W�o<\�>ﰾ\�uÆ�i\�,\�B^��90\�q<פ6\�\nC���Shm?�\�\�=\�\�]:�\�\�8N�7�0\"�Lq!ad�^��B6�!뭲BjZʚB\�-\\5Ir}�Rm݃\��@\�N?\�)��\�i\�v�\Z�}`��i�\�o�\�xD@�21=�.�lR�Fx\"��1Or�\�by<Z)\�@\�,�\�\'}A\�EZ+�$���<Ie��2\',��\�\�\�\�DkY;\�\�\�Z_]���\�W\r�u\�l���\0Ђ\�JN�\�5��k-�\�\���nU\�\�o߲��G��\Zf\�QVܼu\�&1)p1y��v\�j��	�\�߫\�\rx\�7\�\��Hk�\�\�bT��nߋ�\��\����,LR\�\�k\�\\B/װb\�Qu_N>d�b�쒎��\Z�)U-7v][}]Q\�\��,M&5}�\�M�L�\�)�\�P��\�\�R�\�	j����zڄd\�\�`1h�\Z�׾��\�⿶;V�\�^R�\�X=9\�B\�s6γ�ח\�Lɧ\�JTs\�	\�\��Du�d\'\ZJP\�\��D5��Z\�z�\�B�v\�kh֞�>�\�\�U]\�\n.�YcY�\�1z��-��j�\�+?v�)Z\�i3�W\�\�!�dd;/\�\�M�=�ruw\�\�ٓ6��R�M_�?xP\�\�\�\�\�\�[\�\�_X\�\�\��0��\�׎\�\�\�\�d\�3]fd-t�\�\�X\�w~���}5g�\"/�i=\�+>\\Ҭ\�I\�ϧ͗?`�@T\�3&-�+�\�\�2O\�d�#%\�*�,\�\�\�<���r�$\�\�u\�\�%jᰘ~\�\�1gG0s*b�\��[�\�hi b^\�MQ��S}l+?.��[\����\�\�{浱�\�\�f\�+6Es\�\�p��J\�c\�|ċ\��q߇h\�\'6ųyi�\n4W}\�\�1Xn�wm$Oӕ8¤u\�\�7\�rJp5��VZ��_\\�4�\�]�6\�h�\�\����gS`\�s.�9�Q�Ǽ�^\�9���\�\0\�e.>�ոX�y\�S&+�\�\�\��x̢8�\�(�\�ה:\���\�\�\�Thq���H1\�\�\�l\�\�b\��U\'A@�l\rb\Z\�,�x��\�\��l\\IB}�_��\�)Kf�\�<\�Z\Z�i\��^�iG��\�\�YNMfN3*}\��\�=��:P�{\�M}��\�\�\�\�E^���=\r�\'�\�\�:\"�\rV_ջ-��Sj\��Y>\�\�4\Z\�%� Y`\�\�]_��)p>\\\�+��//O���_��D\�\�&\�͂��\�ڌq\�d���	\r>p�2H\�[rV�9SMZ�\�\�f�&\�\���\�\�@x\��\���[��){�}[�~^��nVY)\�\�M�\'�\�Ӟ[�/�l\�\�\�̡dVd\\\Z�7\��� �%o1s]q��W�\"�S\�üi;��\�(\�ʸ�3s���\�v��kؓ\�\�%؄�~,�H?w\�\�r\�bժ����\�k_&\�D\�U\�\��#8�\�\��+�4\�EmM�h\�fS���GU��\�2\�W��|�w\�R^\��2\��$\�c�\��_/S��\��r35�_�bU\�','PIPELINE'),(2,'dd6c6dd475cd4d91c23a9dbaf55eb56b2b1d0d25',_binary 'x�\�][s\�6�+\�\�\�\�4o\�oN\�l�\�ڙ\�ݝ�:\�\�r`��H������\�=\0��eQ�dIV�\�MH�w�\0�?{I\�3ZUI\��\�\�K���9\\\�tX\���\��\�\�E.ӛ�\�}Ф��\�\�\�ݺ�u�K]l�>ͲdBC�N\�8�cM\�8w�\Zu7	/\�a�9\�GY�/!\r�[������)db\��&��<\�\�\0e\��lZ�>��h;�I.\�\�g��\������X�\�4�e\�Viۨ�T2�%�qM\ZWŏ˒��.�tG6w�G�\�\"\�ǁc)\�@H��1\',��X�\�YZ\�V!���\�\�\�\�\�\r\�5B���㵰���fG>\�q�.\��\�\�h\�l\�)�]!\�4��xU\�l6ڦ�\�x��\�|}|v�~\�@�պ\�%t�Wg�V�޾\�\n\�i\�B\�\��\�\�ax{vq|\�\0��QP�\�0�<\��\�\�\�^\�@YG����k\�t\��\�\�\�Wg\'\�Հ�\rH�\�8�#��/.!^\�\"�1/�(��ǉt8�ċ�#��\�H�dhm�\�k�]\�\��\�\��z8O�\��]�\�m*fc�M��\��\�X1\�\�!\�)�>u\�\0\��=�\�}\���\�\�\��v�A�S�!\�8�c��p\\\�!��+�\�\�x\��\�;��C�{6\��Ι\�Z�\�{v�5M\�3#\�~\�z<q�xM�\�v\�{���\�\\��Fnp�m\�\�\�A�hu�\�u\�H�\��/��u�\�G>�1�m\\7\'t�\0~����l\�\�}rg��5��p\�a�9AH�\�vٔaLb��\�C����\�\��\�ץDߪ�gT%eu2,�\�T���.G0\����\�*��*\�KE\�ϯ�]J���\�Gi��I�U�\�$|i��4=�\��OdB\�,�S�@�|f\�%�I�1	l\'�m*�;V\�<��A���}x@{\�.Sm99;y}u�l�\�\�δS.	ۉ�C��\�\"�p\�s�P\�\�|;%>�\�O�J,ږĢ���T\�ޓ�ƺs\�\�}r:�2dC\�8\�\�\ZzLr\�&\"�F��2\�X\�\�i#���\�Z\��z�\��\�\�\�%֡w\����f�U\�0��4��U!�3��}Uu\�{Ђ�y\�^nD|_�>\�\�$\���\r\"�\�\�mA6\�s]\�\�\�\�\�\�ހ~Q�\�|T��\�\�S\�l�P\�\�\�i\�r��H�S#��\�\0����1�#�@u�G�hvI�\�yA8!�e�ְ\�\�j�O݌<\'��J�aqD	%\�b&xH�����oO7�\�PC~T�U\����x�U(]���j\�\���FJC���(?UP\�B�\�@\�f�;��\��g�-�\�A\0�Ow\���C�6\�\�\�<�jH?\�&\��\n���}�*�ċ)\Z�\Z\�\�Cm\�]/r�RN�8�\'xsa\0\�\�\Z�\�q\rS�)�\�qd�\�\��\�ʒ�jn}Al��ī\�Ϫ����QM�cb��[\�\�نn>\�\�̳n>\�\�nt�\�-3Vέo\�mC9�x\�\�Y9��s7ʹ\�\�ַ���ҕ)x`S\'\�C\Z\�B�\�#��\�2?�\���\�\���v~k#[��*\�X5��`�٤\�F�G� \�X,|I&�\�Y�\���7&�O�^��1^\�N\�\�^\\\���4^\��ʊ�(�ZYu���_d\�`\�+%\�B\�e�w�fz\�\����\��\�J`�����\��z�\�$\�T��ޟ��J.:~�V\�\�\\\�,U�[\�7�i\�۝v7Ki�ty\� z��F\�#�G\��\��llI%D\�D��\�R\�%1\���bW~�\�\��T\�p�y\�	\�\�\�\�ը-fť\�\�\�\\/\�\�R\��m\�\�EV�P\�yUd`n��Y\�#-c�l(a��ܫ�9s%�\�)�M�З�t�TB�\�L�Z\���\�\�1ZA\"\����\��\\bh�A\rې\�\�\�\�\��\�	ב8�G���ZJAF$�����Q\�6Ee~|\�j�얥�-�-\�~\�\�\r��\�췣I��\�}�,T�r�\�\�K�\�\�\r]7\0�F�dB׳#ࡔ4\�^�3ç\�=P@4��\0#k�\�\��\�Ţ%�	�b\"b8�AJ�E��\�}\�R\�\�\�m\�\�lשRyQ+=�S\�TXV���S�hh\��Z\�$�\�*Pt\�\�&\�&\�PX�CH�w�\�����\�y�K\�\�Ib\�&8s\��]C�ɀ\�\���U�9\�4Ҧ>UN\'�\�\�6���Po\�׭)�\�\�`\�\�\�$81ZB\�^�\0���*�\\���\�7��{��O|x\���\�,��\��LM�ށ�h�>�o����s[a�qr\�w��ޯoN޽?y}|u\�\�Aj)-?A�\�v��:�svk0\�K\�\��P\���\�8��4�J\�u�/:�^�\'Ӣ��3���\�=\�>�`�-\�r�wm��\�!�\�	0 �\�݋]\�\�\�\�b���\�\��˪��\�$\�\\$��߯H�n��H\�v��\��G�|C�oF�ex�\�|f)O\�llUC\�7�\�e\�<\�\�\Z��T��\�Y���u�\�\�T5��\�\�ԟ�S�X�&6�U�f�V*��UYtZm�)z\'\�T\�&\�4K\�o�>\�\�Rͣ��e1�x���[�*�gӼ�	A�Y&�m\�aMя\�\�\�I���+��cl\�&m\�\�\�c\��\�X�\�$m�\���a���\�\\�\�F��\�\���Sǡ\�\�!��p~F;\�\�A�WFOy�\�\�.��_�Ҭ~�M��\�c�\�\�\�jW,\�^P�K\�*3��6��ŧ֌5Gft��\�\�\�\�t9�#�\�4\�1�8c\�\�U\�\�}k�Z\�\�*\rJT!\'G�SU\�5�c�te\���\�\�	\\\�G��VP+?̚�](��2oQ��8�ȭ��G	/Fy�����溻 �(�w��\�<^o�\�\���\��\��	?\0/�\�*(�G�=\�\�H���\n\\X��V?�|)\n^\r\�u�ȏ�\�\�\�2KYI\�\�\�E�\�׃\�/(H5|��h5_裆/ȳB��i\�\�IS�}\�\��G�Xk*��νh\�\\A�V1�m�_�M\"�vm\�>B3j\��\�h��z\�h}�jj\�\��\"\�\�\r}\�\�ESgHӲ\ryM�P^U�O��N��S�\�P|��j�Z\"E	\��صz\�h�\���up�\�+*\�\�8\�5\'�P��Y7΋\Z�G�S�Z�\�PY�Q���D\�d����!\�3s\�\�IC�#�_/;\�\�5;���f\�\�o\�5/\�^\�\\�\n�\�\�\�$Ř\'���D�	/��	m��\�\�)f,`C\�\�Jx��\�ޝЕ\n\Z��2\�\�.q\n�a\�d\�\�T�\�\�c�\�L��p�r�T\�&�X��,+>��`�kz��L+�o� ��\�{NqB\�	$D�zp:��\�\�|\�\�)q#L�:\�\�_-1݆�.�dc�ۖ�QlgI��\�8\�i��\�\�\�\�@̊�&��*\�Z�0^\�:\�/�-$\�<\��]\�@Z��\�z=��퓹\0�yGS?�W\�h���yG#\�;�W\�S���\�4�V������\�f�d�~�\�4��~�b!9\�Ac�\��RC�0\�ľ\�c\�\�\\zr�}�{�\�\�=-w2BL��\�=\n�\�<p�Ž3O\��\�Ŏ��Ζ>Hn�\�\�_���\�\�D�Wê��Ê˰\�,\��\�I\�\�K�\�5�\Zk�\�J&��\Zft�x\�Z\r�6\�|f4\�l�81\�js\�P{�N)\'7�=\���\"��f\��\�\�-d	�W\\^�)j�{:V��\�¢E\�\�|9t[��\�\�I߻�\�iS4��j��s\�\�G��\���:\�}�K�\�\�\�\"�h��0\�1Xn|3�1���J\�u�e�g\�\�	�\�xΕ2\�\��\�꧉g^j\�cT\�\�\�B�+\�\���\�\\�\�a\�cD\�1ל\�:\��RX�\0�*,\�zT�t�0�\\�\�\�\�I\�y��s�T$i~[p��o(-�F\\���\�r�齅DwfR\�C\�1\�\�<\�\�\�\��i\'\ZɊ\���Ъ\�BdbOo~�\�%<7%\�ﴔ$Ǘ�\'W\�?/^)\"\�jQz�\n�\�HϚ\Z:dRS�\�\�?%\�U���,�? W�\'SUh\�/���Yh�X����̅N\�V�\�\"��\�+\�\�\�(�T�\�\�\�6w}�\�t+nh�L:DF6w�d@fp\�\���P�P�\�8\�9ڹ~P\�\�v\�̿���+�9Z��̙.2G�YLt��kuM�?������;����g\�ӻf���\�\�h\�J��o=O�\�\�\�}&\� vI��\�YY��h\�\�\�\�\�/XԩqOsm���U��7��\�~��aQ�5\�橻�\�a��\� �u	{\�����^�h�\�,F\��*X\\\�\"\�\�{~y\�\�,�k�m07ʕ\�(\�ʊ4bږJ�e\Z\0\�\���\���bՙ','PIPELINE'),(3,'93b84fd7cd172f878122450c2dae6901be99048f',_binary 'x��T�n\Z1��h\�UUh�JnQ���D{Bhd\�C�\�ڮ=�v��\�\�\�z�@��^\�y�y\��\0(�J	���)�~cY�\�nn�[8\�\�S\�\�P�\�F�� `L&j\�S��Al�|�*���d�\�A��D\�\�I�f�!�,\��\� �\"i۟\�2phђ�W7|�)�R!\���\��\��\":\Z\�\\m�T#�\Z_\'�H�E�U��)�\�\r��B\�y�M\�o\�R;\�r%<�o\�4x�KL@kBʆ�s\n��\�T\�\�/�R\�\�Q9��\�\�Zm&\\O�\�\�z�?\�\�Dn5�fu\�\�\�\�I@>;(�[��A�\"\�\�.V�\�N���\�d�\�\n\�\�\�G\�\\U\�t6]]u�\"4c\�\�\�\���\�O�\�P!)�H�a�壷�빥\�\�i\��@M@ȳ=�F�>b��hW\�9�d0����\��Ȓ8\'\�o�\�r�\�s^:�+�i=4\�v��h{y\�I\�\�_H_9\�\�\�l�Mα>-F�Y����qFj�9�l� \�}GSo���r\�^xPA�v\�;\'/,�{Kٕ\�au&�\�}��\�\�\�\�<=r�\�\\!���\�\�\�0���','EXECUTION_PLAN');
/*!40000 ALTER TABLE `snapshots` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-21 10:22:00
