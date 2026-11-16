--
-- Create model Category
--
CREATE TABLE `requests_app_category` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(80) NOT NULL UNIQUE, `description` longtext NOT NULL, `is_active` bool NOT NULL, `created_at` datetime(6) NOT NULL);
--
-- Create model ServiceRequest
--
CREATE TABLE `requests_app_servicerequest` (`id` char(32) NOT NULL PRIMARY KEY, `title` varchar(160) NOT NULL, `description` longtext NOT NULL, `location` varchar(160) NOT NULL, `priority` smallint UNSIGNED NOT NULL CHECK (`priority` >= 0), `status` varchar(20) NOT NULL, `resolved_at` datetime(6) NULL, `created_at` datetime(6) NOT NULL, `updated_at` datetime(6) NOT NULL, `category_id` bigint NOT NULL, `requester_id` integer NOT NULL);
--
-- Create model Comment
--
CREATE TABLE `requests_app_comment` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `body` longtext NOT NULL, `is_internal` bool NOT NULL, `created_at` datetime(6) NOT NULL, `author_id` integer NOT NULL, `service_request_id` char(32) NOT NULL);
--
-- Create model WorkOrder
--
CREATE TABLE `requests_app_workorder` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `work_notes` longtext NOT NULL, `started_at` datetime(6) NULL, `completed_at` datetime(6) NULL, `created_at` datetime(6) NOT NULL, `service_request_id` char(32) NOT NULL UNIQUE, `technician_id` integer NOT NULL);
--
-- Create index req_cat_status_idx on field(s) category, status of model servicerequest
--
CREATE INDEX `req_cat_status_idx` ON `requests_app_servicerequest` (`category_id`, `status`);
--
-- Create index req_priority_date_idx on field(s) priority, created_at of model servicerequest
--
CREATE INDEX `req_priority_date_idx` ON `requests_app_servicerequest` (`priority`, `created_at`);
--
-- Create constraint request_priority_between_1_and_5 on model servicerequest
--
ALTER TABLE `requests_app_servicerequest` ADD CONSTRAINT `request_priority_between_1_and_5` CHECK ((`priority` >= 1 AND `priority` <= 5));
ALTER TABLE `requests_app_servicerequest` ADD CONSTRAINT `requests_app_service_category_id_0ff923b8_fk_requests_` FOREIGN KEY (`category_id`) REFERENCES `requests_app_category` (`id`);
ALTER TABLE `requests_app_servicerequest` ADD CONSTRAINT `requests_app_service_requester_id_ea9aebb5_fk_auth_user` FOREIGN KEY (`requester_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `requests_app_servicerequest_status_01cb29e5` ON `requests_app_servicerequest` (`status`);
ALTER TABLE `requests_app_comment` ADD CONSTRAINT `requests_app_comment_author_id_fd9a7a39_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `requests_app_comment` ADD CONSTRAINT `requests_app_comment_service_request_id_aabf48e6_fk_requests_` FOREIGN KEY (`service_request_id`) REFERENCES `requests_app_servicerequest` (`id`);
ALTER TABLE `requests_app_workorder` ADD CONSTRAINT `requests_app_workord_service_request_id_e851ef84_fk_requests_` FOREIGN KEY (`service_request_id`) REFERENCES `requests_app_servicerequest` (`id`);
ALTER TABLE `requests_app_workorder` ADD CONSTRAINT `requests_app_workorder_technician_id_10dbab3a_fk_auth_user_id` FOREIGN KEY (`technician_id`) REFERENCES `auth_user` (`id`);
