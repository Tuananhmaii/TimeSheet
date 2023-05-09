--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-21 14:00:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 225 (class 1255 OID 16399)
-- Name: update_time_when_duplicate_fullname_and_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_time_when_duplicate_fullname_and_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF EXISTS (SELECT * FROM timesheets_details_tb t WHERE NEW.fullname = t.fullname AND NEW.date = t.date) THEN
		UPDATE timesheets_details_tb
		SET checkin = NEW.checkin, checkout = NEW.checkout, working_hours = NEW.working_hours
		WHERE Timesheets_details_tb.fullname = NEW.fullname AND timesheets_details_tb.date = NEW.date;
        RETURN NULL;
	ELSE
		--INSERT INTO timesheets_details_tb (fullname, date, checkin, checkout, working_hours)
		--VALUES (NEW.fullname, NEW.date, NEW.checkin, NEW.checkout, NEW.working_hours);
	END IF;
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_time_when_duplicate_fullname_and_date() OWNER TO postgres;

--
-- TOC entry 226 (class 1255 OID 16400)
-- Name: update_total_working_hours_and_days(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_total_working_hours_and_days() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
BEGIN
    NEW.total_working_hours := COALESCE(NEW.D1, 0) + COALESCE(NEW.D2, 0) + COALESCE(NEW.D3, 0) + COALESCE(NEW.D4, 0) + COALESCE(NEW.D5, 0) + COALESCE(NEW.D6, 0) + COALESCE(NEW.D7, 0) + 
    COALESCE(NEW.D8, 0) + COALESCE(NEW.D9, 0) + COALESCE(NEW.D10, 0) + COALESCE(NEW.D11, 0) + COALESCE(NEW.D12, 0) + COALESCE(NEW.D13, 0) + COALESCE(NEW.D14, 0) + COALESCE(NEW.D15, 0) + 
    COALESCE(NEW.D16, 0) + COALESCE(NEW.D17, 0) + COALESCE(NEW.D18, 0) + COALESCE(NEW.D19, 0) + COALESCE(NEW.D20, 0) + COALESCE(NEW.D21, 0) + COALESCE(NEW.D22, 0) + COALESCE(NEW.D23, 0) + 
    COALESCE(NEW.D24, 0) + COALESCE(NEW.D25, 0) + COALESCE(NEW.D26, 0) + COALESCE(NEW.D27, 0) + COALESCE(NEW.D28, 0) + COALESCE(NEW.D29, 0) + COALESCE(NEW.D30, 0) + COALESCE(NEW.D31, 0);
    NEW.total_working_days := (CASE WHEN NEW.d1 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d2 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d3 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d4 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d5 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d6 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d7 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d8 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d9 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d10 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d11 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d12 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d13 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d14 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d15 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d16 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d17 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d18 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d19 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d20 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d21 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d22 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d23 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d24 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d25 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d26 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d27 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d28 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d29 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d30 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d31 > 0 THEN 1 ELSE 0 END);
    RETURN NEW;
END;
END;$$;


ALTER FUNCTION public.update_total_working_hours_and_days() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16401)
-- Name: auth_group_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_tb (
    auth_group_id character varying(20) NOT NULL,
    auth_group_name character varying(50)
);


ALTER TABLE public.auth_group_tb OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16404)
-- Name: department_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_tb (
    department_id character varying(20) NOT NULL,
    department_name character varying(50),
    "Descriptons" character varying(100)
);


ALTER TABLE public.department_tb OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16407)
-- Name: member_of_team_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member_of_team_tb (
    team_id character varying(20) NOT NULL,
    member_id character varying(50) NOT NULL,
    "position" character varying(20)
);


ALTER TABLE public.member_of_team_tb OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 41041)
-- Name: position_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.position_tb (
    position_name character varying(50),
    position_id character varying(20) NOT NULL
);


ALTER TABLE public.position_tb OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16410)
-- Name: screen_auth_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.screen_auth_tb (
    auth_group_id character varying(20) NOT NULL,
    screen_id character varying(30) NOT NULL,
    allowed_to_open character varying(1)
);


ALTER TABLE public.screen_auth_tb OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16413)
-- Name: screen_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.screen_tb (
    screen_id character varying(30) NOT NULL,
    screen_name character varying(100)
);


ALTER TABLE public.screen_tb OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16416)
-- Name: team_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_tb (
    team_id character varying(20) NOT NULL,
    team_name character varying(50),
    department_id character varying(20)
);


ALTER TABLE public.team_tb OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16419)
-- Name: timesheets_details_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timesheets_details_tb (
    username character varying(50),
    fullname character varying(100) NOT NULL,
    date date NOT NULL,
    checkin timestamp without time zone,
    checkout timestamp without time zone,
    working_hours numeric(4,1)
);


ALTER TABLE public.timesheets_details_tb OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16422)
-- Name: timesheets_raw_data_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timesheets_raw_data_tb (
    fullname character varying(100),
    in_out_time timestamp without time zone
);


ALTER TABLE public.timesheets_raw_data_tb OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16425)
-- Name: timesheets_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timesheets_tb (
    username character varying(50) NOT NULL,
    fullname character varying(100),
    year integer NOT NULL,
    month integer NOT NULL,
    d1 numeric(3,1),
    d2 numeric(3,1),
    d3 numeric(3,1),
    d4 numeric(3,1),
    d5 numeric(3,1),
    d6 numeric(3,1),
    d7 numeric(3,1),
    d8 numeric(3,1),
    d9 numeric(3,1),
    d10 numeric(3,1),
    d11 numeric(3,1),
    d12 numeric(3,1),
    d13 numeric(3,1),
    d14 numeric(3,1),
    d15 numeric(3,1),
    d16 numeric(3,1),
    d17 numeric(3,1),
    d18 numeric(3,1),
    d19 numeric(3,1),
    d20 numeric(3,1),
    d21 numeric(3,1),
    d22 numeric(3,1),
    d23 numeric(3,1),
    d24 numeric(3,1),
    d25 numeric(3,1),
    d26 numeric(3,1),
    d27 numeric(3,1),
    d28 numeric(3,1),
    d29 numeric(3,1),
    d30 numeric(3,1),
    d31 numeric(3,1),
    total_working_days numeric(3,1),
    total_working_hours numeric(4,1)
);


ALTER TABLE public.timesheets_tb OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16428)
-- Name: user_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tb (
    username character varying(50) NOT NULL,
    password character varying(50),
    fullname character varying(50),
    birth_date date,
    email character varying(100),
    phone character varying(20),
    address character varying(200),
    ethnic character varying(10),
    religion character varying(10),
    citizen_id character varying(10),
    tax_code character varying(10),
    social_insurance_no character varying(10),
    date_hired date,
    contract_no character varying(10),
    auth_group_id character varying(20),
    photo bytea,
    gender boolean,
    department_id character varying(20),
    team_id character varying(20),
    position_id character varying(20)
);


ALTER TABLE public.user_tb OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 16401)
-- Dependencies: 214
-- Data for Name: auth_group_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_group_tb VALUES ('Admin', 'Administrator');
INSERT INTO public.auth_group_tb VALUES ('User', 'User');


--
-- TOC entry 3385 (class 0 OID 16404)
-- Dependencies: 215
-- Data for Name: department_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.department_tb VALUES ('MKT', 'Marketing', 'Phòng marketing');
INSERT INTO public.department_tb VALUES ('BOD', 'Director', 'Phòng giám đốc');
INSERT INTO public.department_tb VALUES ('DEV', 'Development', 'Phòng phát triển');
INSERT INTO public.department_tb VALUES ('PRODUCT', 'Production', 'Phòng sản xuất');
INSERT INTO public.department_tb VALUES ('ACCOUNT', 'Accounting', 'Phòng kế toán');
INSERT INTO public.department_tb VALUES ('HR', 'Human Resource', 'Phòng nhân sự');


--
-- TOC entry 3386 (class 0 OID 16407)
-- Dependencies: 216
-- Data for Name: member_of_team_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.member_of_team_tb VALUES ('NET', 'ThanhDD', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('BOD', 'ThaoLS', 'BOD');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'ThienLTH', 'PM');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'ChuongLV', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('HR', 'VyTTH', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('NET', 'DatTC', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('Comtor', 'SangLT', 'PM');
INSERT INTO public.member_of_team_tb VALUES ('PHP', 'TrungNT', 'PM');
INSERT INTO public.member_of_team_tb VALUES ('PHP', 'HungTH', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('PHP', 'HoanTV', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('PHP', 'HaiNV', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'DungLV', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('React', 'DatNT', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'HiepPD', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('PHP', 'HaiN', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'HaoH', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'HoangL', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'TuanLQ', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('React', 'QuangNM', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('React', 'ThanhDT', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('React', 'LuanND', 'Member');


--
-- TOC entry 3394 (class 0 OID 41041)
-- Dependencies: 224
-- Data for Name: position_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.position_tb VALUES ('Leader', 'PM');
INSERT INTO public.position_tb VALUES ('Member
', 'Mem');


--
-- TOC entry 3387 (class 0 OID 16410)
-- Dependencies: 217
-- Data for Name: screen_auth_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmLogin', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmMenu', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmPersonalInfo', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmEmployeeList', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmPersonalTimesheets', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmTimesheets', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'tsmi_Logout', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmPersonalTimesheet', '1');


--
-- TOC entry 3388 (class 0 OID 16413)
-- Dependencies: 218
-- Data for Name: screen_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.screen_tb VALUES ('frmLogin', 'Màn hình đăng nhập');
INSERT INTO public.screen_tb VALUES ('frmMenu', 'Màn hình Menu');
INSERT INTO public.screen_tb VALUES ('frmEmpoloyeeList', 'Màn hình danh sách nhân viên');


--
-- TOC entry 3389 (class 0 OID 16416)
-- Dependencies: 219
-- Data for Name: team_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.team_tb VALUES ('Comtor', 'DEV Development', 'DEV');
INSERT INTO public.team_tb VALUES ('HR', 'Human Resource', 'HR');
INSERT INTO public.team_tb VALUES ('JAVA', 'Java Development', 'DEV');
INSERT INTO public.team_tb VALUES ('NET', 'NET Development', 'DEV');
INSERT INTO public.team_tb VALUES ('BOD', 'Director team', 'BOD');
INSERT INTO public.team_tb VALUES ('PHP', 'PHP Development', 'DEV');
INSERT INTO public.team_tb VALUES ('React', 'REACT Development', 'DEV');
INSERT INTO public.team_tb VALUES ('Tester', 'TESTER Development', 'DEV');


--
-- TOC entry 3390 (class 0 OID 16419)
-- Dependencies: 220
-- Data for Name: timesheets_details_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2022-11-29', '2022-11-29 13:30:24', '2022-11-29 16:42:00', 3.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Long', '2022-11-28', '2022-11-28 07:59:20', '2022-11-28 13:30:05', 5.5);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2022-11-25', '2022-11-25 17:02:38', '2022-11-25 17:02:38', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-27', '2022-11-27 14:01:35', '2022-11-27 14:01:35', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2022-11-29', '2022-11-29 10:30:30', '2022-11-29 17:04:33', 6.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-28', '2022-11-28 11:31:26', '2022-11-28 13:24:45', 1.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2022-11-29', '2022-11-29 08:04:35', '2022-11-29 15:40:23', 7.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2022-11-29', '2022-11-29 09:04:35', '2022-11-29 16:03:59', 7.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2022-11-28', '2022-11-28 07:45:22', '2022-11-28 16:48:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Long', '2022-11-29', '2022-11-29 07:56:11', '2022-11-29 15:17:22', 7.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2022-11-30', '2022-11-30 11:23:23', '2022-11-30 14:58:46', 3.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-27', '2022-11-27 17:11:37', '2022-11-27 17:41:45', 0.5);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-30', '2022-11-30 08:26:23', '2022-11-30 13:01:27', 4.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2022-11-30', '2022-11-30 10:40:13', '2022-11-30 14:04:41', 3.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-30', '2022-11-30 10:25:12', '2022-11-30 14:46:19', 4.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2022-11-30', '2022-11-30 08:06:10', '2022-11-30 08:06:10', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2022-11-30', '2022-11-30 07:53:49', '2022-11-30 13:19:02', 5.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2022-11-29', '2022-11-29 07:50:34', '2022-11-29 14:39:08', 6.8);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2022-11-28', '2022-11-28 08:02:57', '2022-11-28 13:00:38', 5.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2022-11-25', '2022-11-25 16:55:51', '2022-11-25 16:55:51', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-21', '2022-11-21 16:25:49', '2022-11-21 16:26:03', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-21', '2022-11-21 07:58:20', '2022-11-21 10:51:01', 2.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2022-11-28', '2022-11-28 07:54:02', '2022-11-28 13:10:28', 5.3);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-24', '2022-11-24 09:37:39', '2022-11-24 09:37:39', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-26', '2022-11-26 17:46:29', '2022-11-26 17:46:46', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'CẢNH BÁO!', '2022-11-25', '2022-11-25 16:53:04', '2022-11-25 16:53:04', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-26', '2022-11-26 09:11:05', '2022-11-26 14:23:04', 5.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-29', '2022-11-29 11:41:09', '2022-11-29 17:16:28', 5.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2022-11-29', '2022-11-29 07:09:43', '2022-11-29 07:09:43', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2022-11-30', '2022-11-30 12:23:21', '2022-11-30 12:23:21', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-23', '2022-11-23 13:09:14', '2022-11-23 13:09:26', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2022-11-28', '2022-11-28 12:37:53', '2022-11-28 12:37:53', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-20', '2022-11-20 08:08:58', '2022-11-20 08:08:58', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-30', '2022-11-30 13:38:22', '2022-11-30 13:38:22', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-29', '2022-11-29 08:36:49', '2022-11-29 09:48:54', 1.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-25', '2022-11-25 08:12:20', '2022-11-25 15:28:19', 7.3);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-29', '2022-11-29 07:54:42', '2022-11-29 13:07:31', 5.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-25', '2022-11-25 11:52:02', '2022-11-25 11:52:02', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2022-11-30', '2022-11-30 07:49:58', '2022-11-30 14:40:42', 6.8);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-28', '2022-11-28 07:52:40', '2022-11-28 14:09:11', 6.3);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2022-11-28', '2022-11-28 11:46:40', '2022-11-28 13:40:13', 1.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-24', '2022-11-24 13:24:48', '2022-11-24 13:24:48', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2022-11-25', '2022-11-25 17:00:11', '2022-11-25 17:00:11', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2022-11-29', '2022-11-29 12:52:27', '2022-11-29 15:42:12', 2.8);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Huỳnh Quốc Trung', '2022-11-25', '2022-11-25 17:35:15', '2022-11-25 17:35:47', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2022-11-25', '2022-11-25 16:55:18', '2022-11-25 17:03:14', 0.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2022-11-28', '2022-11-28 08:03:06', '2022-11-28 16:02:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'CẢNH BÁO!', '2022-11-28', '2022-11-28 07:52:57', '2022-11-28 07:52:57', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-29', '2022-11-29 07:52:56', '2022-11-29 14:46:20', 6.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-28', '2022-11-28 07:48:51', '2022-11-28 14:56:11', 7.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-25', '2022-11-25 16:55:15', '2022-11-25 16:55:15', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2022-11-28', '2022-11-28 12:37:08', '2022-11-28 20:44:58', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-30', '2022-11-30 07:44:25', '2022-11-30 07:44:25', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47363565944846', '2022-11-30', '2022-11-30 15:24:38', '2022-11-30 15:24:38', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2022-11-29', '2022-11-29 07:58:55', '2022-11-29 13:06:57', 5.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Long', '2022-11-30', '2022-11-30 12:23:00', '2022-11-30 12:23:00', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-14', '2023-03-14 08:05:46', '2023-03-14 08:05:46', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-06', '2023-03-06 07:26:50', '2023-03-06 07:26:50', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-21', '2023-03-21 08:10:36', '2023-03-21 08:10:36', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-07', '2023-03-07 07:57:48', '2023-03-07 17:03:24', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-16', '2023-03-16 08:04:53', '2023-03-16 12:02:12', 4.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-13', '2023-03-13 07:53:43', '2023-03-13 17:11:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-21', '2023-03-21 07:52:43', '2023-03-21 17:28:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-10', '2023-03-10 17:12:48', '2023-03-10 17:12:48', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-20', '2023-03-20 09:30:47', '2023-03-20 18:56:39', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-20', '2023-03-20 07:52:10', '2023-03-20 17:03:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-09', '2023-03-09 08:14:20', '2023-03-09 17:08:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-31', '2023-03-31 08:02:43', '2023-03-31 17:00:34', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-21', '2023-03-21 07:58:12', '2023-03-21 17:02:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-07', '2023-03-07 07:59:56', '2023-03-07 17:16:48', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-02', '2023-03-02 08:00:14', '2023-03-02 08:00:14', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-10', '2023-03-10 07:52:31', '2023-03-10 14:32:46', 6.7);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-10', '2023-03-10 08:01:23', '2023-03-10 17:07:54', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-28', '2023-03-28 07:53:04', '2023-03-28 17:18:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-09', '2023-03-09 08:00:40', '2023-03-09 17:06:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-31', '2023-03-31 07:59:42', '2023-03-31 17:08:12', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-30', '2023-03-30 08:10:12', '2023-03-30 17:46:28', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-27', '2023-03-27 08:09:25', '2023-03-27 17:11:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-31', '2023-03-31 07:49:20', '2023-03-31 17:08:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-17', '2023-03-17 08:08:34', '2023-03-17 17:02:46', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-09', '2023-03-09 08:28:02', '2023-03-09 17:18:51', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-22', '2023-03-22 07:57:22', '2023-03-22 17:24:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-09', '2023-03-09 07:44:08', '2023-03-09 17:08:33', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-03', '2023-03-03 09:52:23', '2023-03-03 17:37:01', 7.7);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-06', '2023-03-06 07:49:11', '2023-03-06 17:17:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-17', '2023-03-17 07:57:14', '2023-03-17 16:59:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-24', '2023-03-24 07:51:16', '2023-03-24 17:07:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-01', '2023-03-01 09:11:29', '2023-03-01 17:23:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-21', '2023-03-21 07:59:19', '2023-03-21 19:02:53', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'CẢNH BÁO!', '2023-03-02', '2023-03-02 17:11:23', '2023-03-02 17:11:23', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-28', '2023-03-28 07:53:02', '2023-03-28 17:11:51', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-16', '2023-03-16 07:24:49', '2023-03-16 17:10:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-13', '2023-03-13 07:58:24', '2023-03-13 17:03:28', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-28', '2023-03-28 07:43:51', '2023-03-28 17:06:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-02', '2023-03-02 07:58:04', '2023-03-02 17:11:02', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-15', '2023-03-15 07:26:45', '2023-03-15 17:07:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-20', '2023-03-20 07:53:46', '2023-03-20 07:53:46', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-31', '2023-03-31 08:13:45', '2023-03-31 17:03:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-17', '2023-03-17 07:54:59', '2023-03-17 17:02:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-16', '2023-03-16 07:40:32', '2023-03-16 17:07:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-17', '2023-03-17 07:37:03', '2023-03-17 17:01:34', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-28', '2023-03-28 17:15:12', '2023-03-28 17:15:12', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-22', '2023-03-22 07:47:01', '2023-03-22 17:06:00', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-23', '2023-03-23 08:09:35', '2023-03-23 17:34:46', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-15', '2023-03-15 08:01:58', '2023-03-15 17:07:14', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-15', '2023-03-15 08:03:50', '2023-03-15 08:03:50', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-09', '2023-03-09 07:48:35', '2023-03-09 12:02:53', 4.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-20', '2023-03-20 07:52:05', '2023-03-20 17:07:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-13', '2023-03-13 08:00:37', '2023-03-13 17:16:19', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-16', '2023-03-16 08:03:54', '2023-03-16 17:10:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-16', '2023-03-16 08:17:03', '2023-03-16 17:33:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-21', '2023-03-21 08:18:37', '2023-03-21 17:40:24', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-21', '2023-03-21 07:26:10', '2023-03-21 17:33:04', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-06', '2023-03-06 08:14:12', '2023-03-06 17:38:49', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-01', '2023-03-01 08:00:39', '2023-03-01 16:07:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-24', '2023-03-24 07:36:37', '2023-03-24 07:36:37', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-24', '2023-03-24 07:59:17', '2023-03-24 07:59:17', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-08', '2023-03-08 07:36:07', '2023-03-08 17:16:33', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-10', '2023-03-10 07:50:23', '2023-03-10 17:08:44', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-07', '2023-03-07 07:55:16', '2023-03-07 17:04:55', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-16', '2023-03-16 07:59:26', '2023-03-16 17:07:06', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-31', '2023-03-31 07:32:24', '2023-03-31 17:18:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-20', '2023-03-20 07:55:35', '2023-03-20 17:06:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-16', '2023-03-16 08:14:18', '2023-03-16 19:19:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-15', '2023-03-15 08:03:47', '2023-03-15 18:25:46', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-03', '2023-03-03 07:39:38', '2023-03-03 17:39:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-03', '2023-03-03 08:14:10', '2023-03-03 08:14:10', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47911887175708', '2023-03-13', '2023-03-13 12:53:52', '2023-03-13 12:53:52', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-14', '2023-03-14 09:27:39', '2023-03-14 17:33:49', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-17', '2023-03-17 07:47:47', '2023-03-17 17:33:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-20', '2023-03-20 07:53:53', '2023-03-20 17:09:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-29', '2023-03-29 08:02:55', '2023-03-29 17:11:46', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-16', '2023-03-16 07:59:19', '2023-03-16 17:05:11', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-03', '2023-03-03 17:39:45', '2023-03-03 17:39:45', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-21', '2023-03-21 08:00:34', '2023-03-21 17:13:41', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-29', '2023-03-29 07:47:19', '2023-03-29 13:10:36', 5.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-24', '2023-03-24 08:00:36', '2023-03-24 17:39:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-03', '2023-03-03 07:48:25', '2023-03-03 17:33:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-02', '2023-03-02 08:10:49', '2023-03-02 17:10:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-28', '2023-03-28 07:45:15', '2023-03-28 17:06:50', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-09', '2023-03-09 08:12:45', '2023-03-09 17:08:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-09', '2023-03-09 07:57:08', '2023-03-09 17:05:30', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-17', '2023-03-17 07:58:00', '2023-03-17 17:33:50', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47911887175708', '2023-03-14', '2023-03-14 14:43:37', '2023-03-14 14:43:37', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-13', '2023-03-13 12:45:15', '2023-03-13 12:45:15', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-27', '2023-03-27 07:57:48', '2023-03-27 17:32:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-23', '2023-03-23 08:09:31', '2023-03-23 17:15:45', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-30', '2023-03-30 08:04:21', '2023-03-30 08:04:21', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-03', '2023-03-03 07:46:22', '2023-03-03 17:34:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-09', '2023-03-09 07:57:02', '2023-03-09 17:02:12', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-15', '2023-03-15 08:18:26', '2023-03-15 18:25:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-22', '2023-03-22 08:17:16', '2023-03-22 17:41:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-23', '2023-03-23 08:00:03', '2023-03-23 08:00:03', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-07', '2023-03-07 12:42:58', '2023-03-07 12:42:58', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-02', '2023-03-02 07:44:00', '2023-03-02 17:10:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-02', '2023-03-02 07:47:07', '2023-03-02 17:10:34', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-27', '2023-03-27 07:32:25', '2023-03-27 17:05:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-01', '2023-03-01 07:55:01', '2023-03-01 07:55:01', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-03', '2023-03-03 14:38:07', '2023-03-03 14:38:07', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-03', '2023-03-03 08:02:38', '2023-03-03 15:12:57', 7.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-17', '2023-03-17 07:57:09', '2023-03-17 17:02:49', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-06', '2023-03-06 08:00:32', '2023-03-06 17:18:54', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-02', '2023-03-02 07:38:32', '2023-03-02 17:10:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'CẢNH BÁO!', '2023-03-08', '2023-03-08 15:55:28', '2023-03-08 15:55:28', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-22', '2023-03-22 07:59:07', '2023-03-22 17:08:50', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-06', '2023-03-06 07:53:28', '2023-03-06 17:07:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-06', '2023-03-06 08:18:37', '2023-03-06 19:18:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-01', '2023-03-01 07:55:05', '2023-03-01 17:14:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-22', '2023-03-22 07:54:08', '2023-03-22 17:40:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-17', '2023-03-17 07:28:20', '2023-03-17 17:04:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-14', '2023-03-14 07:51:55', '2023-03-14 07:51:55', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-29', '2023-03-29 07:41:27', '2023-03-29 17:38:44', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-08', '2023-03-08 17:12:45', '2023-03-08 17:12:45', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-21', '2023-03-21 08:09:10', '2023-03-21 08:09:10', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-03', '2023-03-03 08:04:39', '2023-03-03 17:34:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-08', '2023-03-08 07:52:46', '2023-03-08 17:14:58', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-28', '2023-03-28 17:14:13', '2023-03-28 17:14:13', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-22', '2023-03-22 07:54:05', '2023-03-22 17:08:43', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-27', '2023-03-27 08:01:38', '2023-03-27 17:08:41', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-15', '2023-03-15 07:56:18', '2023-03-15 17:05:30', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-14', '2023-03-14 07:29:52', '2023-03-14 17:22:19', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-08', '2023-03-08 07:48:56', '2023-03-08 17:02:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-16', '2023-03-16 07:44:39', '2023-03-16 17:05:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-27', '2023-03-27 11:08:39', '2023-03-27 11:08:39', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-27', '2023-03-27 07:54:21', '2023-03-27 07:54:21', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-23', '2023-03-23 17:10:22', '2023-03-23 17:10:22', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-09', '2023-03-09 07:55:46', '2023-03-09 07:55:46', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-08', '2023-03-08 17:13:03', '2023-03-08 17:13:03', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-30', '2023-03-30 08:03:23', '2023-03-30 17:12:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-03', '2023-03-03 08:04:35', '2023-03-03 17:34:14', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-09', '2023-03-09 08:01:34', '2023-03-09 17:07:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-01', '2023-03-01 07:39:08', '2023-03-01 17:13:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-01', '2023-03-01 09:12:22', '2023-03-01 17:22:58', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-24', '2023-03-24 08:01:33', '2023-03-24 08:01:33', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-15', '2023-03-15 07:54:04', '2023-03-15 17:07:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-14', '2023-03-14 07:56:58', '2023-03-14 07:56:58', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-23', '2023-03-23 07:43:34', '2023-03-23 17:06:14', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-31', '2023-03-31 07:42:16', '2023-03-31 07:42:16', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-10', '2023-03-10 07:55:54', '2023-03-10 19:04:31', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-02', '2023-03-02 07:45:29', '2023-03-02 17:12:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-10', '2023-03-10 08:05:06', '2023-03-10 08:05:06', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-22', '2023-03-22 07:27:46', '2023-03-22 17:08:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-20', '2023-03-20 07:10:40', '2023-03-20 17:07:04', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-20', '2023-03-20 08:09:31', '2023-03-20 18:14:26', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-02', '2023-03-02 08:34:38', '2023-03-02 08:34:38', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-21', '2023-03-21 07:49:44', '2023-03-21 07:49:44', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-13', '2023-03-13 07:48:26', '2023-03-13 17:03:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-14', '2023-03-14 08:00:27', '2023-03-14 08:00:27', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-09', '2023-03-09 07:59:24', '2023-03-09 17:18:25', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-21', '2023-03-21 07:54:31', '2023-03-21 17:09:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-03', '2023-03-03 07:53:52', '2023-03-03 17:39:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-27', '2023-03-27 08:09:34', '2023-03-27 08:09:34', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-09', '2023-03-09 08:16:10', '2023-03-09 17:12:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-14', '2023-03-14 07:59:49', '2023-03-14 17:24:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-09', '2023-03-09 08:15:52', '2023-03-09 08:15:52', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-14', '2023-03-14 08:13:51', '2023-03-14 17:32:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-31', '2023-03-31 08:02:11', '2023-03-31 08:02:11', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-28', '2023-03-28 08:04:28', '2023-03-28 08:04:28', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-02', '2023-03-02 11:35:01', '2023-03-02 11:35:01', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-14', '2023-03-14 07:55:46', '2023-03-14 17:06:09', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-06', '2023-03-06 07:42:42', '2023-03-06 17:38:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-23', '2023-03-23 07:52:18', '2023-03-23 17:43:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-06', '2023-03-06 08:04:14', '2023-03-06 17:17:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-07', '2023-03-07 08:19:48', '2023-03-07 18:47:53', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-16', '2023-03-16 07:57:16', '2023-03-16 17:49:24', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-14', '2023-03-14 07:57:35', '2023-03-14 17:10:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-03', '2023-03-03 07:49:42', '2023-03-03 17:43:48', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-15', '2023-03-15 07:45:35', '2023-03-15 17:27:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-08', '2023-03-08 08:04:52', '2023-03-08 17:19:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-22', '2023-03-22 07:31:28', '2023-03-22 17:40:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-10', '2023-03-10 07:47:15', '2023-03-10 17:08:48', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-30', '2023-03-30 07:47:50', '2023-03-30 17:48:04', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-23', '2023-03-23 07:25:40', '2023-03-23 17:44:11', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-07', '2023-03-07 08:03:13', '2023-03-07 08:03:13', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-29', '2023-03-29 08:26:56', '2023-03-29 17:38:11', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-13', '2023-03-13 10:18:47', '2023-03-13 17:11:18', 6.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-13', '2023-03-13 08:08:32', '2023-03-13 17:36:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-21', '2023-03-21 08:00:29', '2023-03-21 17:16:53', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-27', '2023-03-27 08:05:45', '2023-03-27 19:02:26', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-15', '2023-03-15 07:44:14', '2023-03-15 17:03:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'CẢNH BÁO!', '2023-03-30', '2023-03-30 17:11:42', '2023-03-30 17:11:42', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-29', '2023-03-29 08:00:16', '2023-03-29 17:39:33', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-13', '2023-03-13 07:56:17', '2023-03-13 17:36:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-20', '2023-03-20 08:00:58', '2023-03-20 17:25:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-15', '2023-03-15 08:14:04', '2023-03-15 17:07:41', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-07', '2023-03-07 15:59:56', '2023-03-07 17:07:10', 1.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-16', '2023-03-16 08:01:40', '2023-03-16 17:07:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-16', '2023-03-16 07:59:22', '2023-03-16 17:10:45', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-27', '2023-03-27 08:21:53', '2023-03-27 17:36:00', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-23', '2023-03-23 07:41:12', '2023-03-23 07:41:12', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-21', '2023-03-21 07:57:58', '2023-03-21 17:04:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-08', '2023-03-08 07:59:32', '2023-03-08 17:05:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-08', '2023-03-08 15:10:17', '2023-03-08 15:10:17', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-30', '2023-03-30 08:19:33', '2023-03-30 17:34:00', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-10', '2023-03-10 07:53:50', '2023-03-10 17:03:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-09', '2023-03-09 07:55:44', '2023-03-09 17:08:44', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-07', '2023-03-07 07:51:21', '2023-03-07 07:51:21', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-07', '2023-03-07 17:12:12', '2023-03-07 17:12:12', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-27', '2023-03-27 08:07:37', '2023-03-27 17:32:35', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-27', '2023-03-27 08:15:24', '2023-03-27 08:15:24', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-22', '2023-03-22 07:42:06', '2023-03-22 17:41:09', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-13', '2023-03-13 08:00:54', '2023-03-13 08:00:54', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-24', '2023-03-24 08:34:01', '2023-03-24 17:40:25', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-22', '2023-03-22 07:48:32', '2023-03-22 17:07:46', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-20', '2023-03-20 08:00:44', '2023-03-20 08:00:44', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-21', '2023-03-21 07:56:47', '2023-03-21 07:56:47', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-30', '2023-03-30 07:27:45', '2023-03-30 17:10:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-29', '2023-03-29 08:11:08', '2023-03-29 17:07:24', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-29', '2023-03-29 07:35:41', '2023-03-29 17:07:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-13', '2023-03-13 08:46:32', '2023-03-13 17:29:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-24', '2023-03-24 07:49:51', '2023-03-24 07:49:51', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-01', '2023-03-01 17:22:35', '2023-03-01 17:22:35', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-08', '2023-03-08 07:37:28', '2023-03-08 15:52:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-23', '2023-03-23 07:36:43', '2023-03-23 16:04:36', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-16', '2023-03-16 07:55:31', '2023-03-16 17:03:09', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-14', '2023-03-14 07:38:47', '2023-03-14 07:38:47', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-07', '2023-03-07 08:00:43', '2023-03-07 11:53:20', 3.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-16', '2023-03-16 07:47:27', '2023-03-16 17:05:19', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-17', '2023-03-17 08:01:14', '2023-03-17 17:03:50', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-27', '2023-03-27 07:59:33', '2023-03-27 17:02:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-08', '2023-03-08 08:23:40', '2023-03-08 08:23:40', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-29', '2023-03-29 08:14:29', '2023-03-29 17:28:55', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-13', '2023-03-13 10:41:54', '2023-03-13 10:41:54', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-03', '2023-03-03 08:00:23', '2023-03-03 17:33:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-02', '2023-03-02 07:58:08', '2023-03-02 16:14:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-08', '2023-03-08 18:01:02', '2023-03-08 18:01:02', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-23', '2023-03-23 07:59:42', '2023-03-23 17:14:15', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-15', '2023-03-15 07:55:52', '2023-03-15 07:55:52', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-07', '2023-03-07 07:48:58', '2023-03-07 17:18:05', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-21', '2023-03-21 07:54:28', '2023-03-21 17:16:44', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-14', '2023-03-14 08:12:08', '2023-03-14 08:12:08', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-24', '2023-03-24 08:08:34', '2023-03-24 18:12:02', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-24', '2023-03-24 08:03:43', '2023-03-24 17:08:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-14', '2023-03-14 08:08:36', '2023-03-14 17:10:33', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-27', '2023-03-27 08:04:06', '2023-03-27 17:11:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-15', '2023-03-15 08:03:44', '2023-03-15 08:03:44', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-10', '2023-03-10 07:59:20', '2023-03-10 07:59:20', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-30', '2023-03-30 07:56:22', '2023-03-30 17:34:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-02', '2023-03-02 07:53:58', '2023-03-02 17:11:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-30', '2023-03-30 07:40:29', '2023-03-30 17:22:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-06', '2023-03-06 07:53:31', '2023-03-06 17:17:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-02', '2023-03-02 08:19:49', '2023-03-02 08:19:49', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-24', '2023-03-24 08:06:25', '2023-03-24 08:06:25', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-17', '2023-03-17 08:10:21', '2023-03-17 17:34:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-08', '2023-03-08 07:44:36', '2023-03-08 17:17:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-15', '2023-03-15 07:50:53', '2023-03-15 15:55:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-14', '2023-03-14 07:49:53', '2023-03-14 17:12:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-23', '2023-03-23 07:53:24', '2023-03-23 17:19:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-31', '2023-03-31 07:57:22', '2023-03-31 17:03:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-13', '2023-03-13 07:54:21', '2023-03-13 17:38:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-07', '2023-03-07 07:51:26', '2023-03-07 17:37:02', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-17', '2023-03-17 07:51:04', '2023-03-17 17:03:39', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-13', '2023-03-13 07:51:30', '2023-03-13 17:29:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-02', '2023-03-02 07:55:55', '2023-03-02 17:06:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-20', '2023-03-20 07:49:06', '2023-03-20 17:07:00', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-07', '2023-03-07 08:00:00', '2023-03-07 17:18:54', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-13', '2023-03-13 08:36:49', '2023-03-13 17:59:56', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-23', '2023-03-23 07:55:09', '2023-03-23 17:01:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-08', '2023-03-08 07:52:48', '2023-03-08 07:52:48', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-24', '2023-03-24 08:06:27', '2023-03-24 17:01:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-30', '2023-03-30 07:59:06', '2023-03-30 13:54:58', 5.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-24', '2023-03-24 07:54:56', '2023-03-24 17:04:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-23', '2023-03-23 07:56:59', '2023-03-23 17:10:25', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-23', '2023-03-23 08:12:27', '2023-03-23 19:11:51', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-09', '2023-03-09 07:53:57', '2023-03-09 17:08:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-02', '2023-03-02 07:45:22', '2023-03-02 17:10:49', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-23', '2023-03-23 08:12:12', '2023-03-23 18:02:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-28', '2023-03-28 17:06:32', '2023-03-28 17:06:32', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-31', '2023-03-31 07:59:55', '2023-03-31 17:08:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-21', '2023-03-21 08:10:42', '2023-03-21 17:51:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-27', '2023-03-27 07:47:41', '2023-03-27 07:47:41', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-23', '2023-03-23 08:27:47', '2023-03-23 18:01:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-02', '2023-03-02 15:37:44', '2023-03-02 17:10:52', 1.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-16', '2023-03-16 07:59:35', '2023-03-16 17:11:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-03', '2023-03-03 07:52:28', '2023-03-03 17:39:35', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-22', '2023-03-22 08:02:55', '2023-03-22 08:02:55', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-01', '2023-03-01 08:09:23', '2023-03-01 17:25:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-14', '2023-03-14 07:21:37', '2023-03-14 17:25:12', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-17', '2023-03-17 07:57:20', '2023-03-17 17:03:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-07', '2023-03-07 07:53:05', '2023-03-07 17:17:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-06', '2023-03-06 08:00:54', '2023-03-06 08:00:54', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-20', '2023-03-20 07:19:33', '2023-03-20 17:06:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-17', '2023-03-17 08:01:02', '2023-03-17 17:04:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47911887175708', '2023-03-08', '2023-03-08 14:27:02', '2023-03-08 14:27:02', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-07', '2023-03-07 07:49:30', '2023-03-07 17:23:06', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-27', '2023-03-27 08:15:19', '2023-03-27 08:15:19', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-28', '2023-03-28 07:51:29', '2023-03-28 17:07:48', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-22', '2023-03-22 07:57:19', '2023-03-22 15:54:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-13', '2023-03-13 08:36:40', '2023-03-13 17:58:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-16', '2023-03-16 07:59:30', '2023-03-16 17:15:49', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-30', '2023-03-30 07:51:29', '2023-03-30 17:19:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-27', '2023-03-27 07:57:51', '2023-03-27 17:11:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-10', '2023-03-10 07:55:29', '2023-03-10 17:08:54', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-22', '2023-03-22 07:55:46', '2023-03-22 17:08:53', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-01', '2023-03-01 07:46:08', '2023-03-01 17:23:06', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-17', '2023-03-17 08:07:42', '2023-03-17 08:07:42', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-14', '2023-03-14 08:01:45', '2023-03-14 17:00:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-29', '2023-03-29 07:58:04', '2023-03-29 17:39:36', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-08', '2023-03-08 15:13:10', '2023-03-08 15:19:15', 0.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-16', '2023-03-16 07:57:20', '2023-03-16 17:02:58', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-30', '2023-03-30 07:59:12', '2023-03-30 17:17:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-09', '2023-03-09 08:05:04', '2023-03-09 17:05:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-03', '2023-03-03 07:49:32', '2023-03-03 17:34:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-28', '2023-03-28 07:46:40', '2023-03-28 17:07:39', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-06', '2023-03-06 08:05:31', '2023-03-06 08:05:31', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-07', '2023-03-07 07:47:37', '2023-03-07 17:12:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-08', '2023-03-08 07:38:54', '2023-03-08 17:04:28', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-07', '2023-03-07 08:02:04', '2023-03-07 17:22:31', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-13', '2023-03-13 07:56:40', '2023-03-13 07:56:40', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-01', '2023-03-01 08:05:07', '2023-03-01 17:13:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-01', '2023-03-01 08:09:25', '2023-03-01 08:09:25', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-14', '2023-03-14 07:51:15', '2023-03-14 17:14:04', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-16', '2023-03-16 17:33:31', '2023-03-16 17:33:31', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-10', '2023-03-10 08:06:18', '2023-03-10 08:06:18', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-28', '2023-03-28 08:34:10', '2023-03-28 08:34:10', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-22', '2023-03-22 08:31:45', '2023-03-22 18:40:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-24', '2023-03-24 08:01:40', '2023-03-24 17:18:28', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-14', '2023-03-14 07:43:38', '2023-03-14 17:32:12', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-09', '2023-03-09 08:14:49', '2023-03-09 17:18:55', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-09', '2023-03-09 08:01:31', '2023-03-09 17:02:45', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-29', '2023-03-29 07:58:07', '2023-03-29 17:22:48', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-30', '2023-03-30 07:56:27', '2023-03-30 17:17:24', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-30', '2023-03-30 07:59:14', '2023-03-30 16:54:14', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-13', '2023-03-13 07:37:39', '2023-03-13 17:58:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-09', '2023-03-09 07:27:08', '2023-03-09 17:05:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-29', '2023-03-29 07:58:18', '2023-03-29 17:39:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-16', '2023-03-16 07:47:36', '2023-03-16 17:11:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-29', '2023-03-29 08:05:09', '2023-03-29 17:39:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-23', '2023-03-23 07:49:28', '2023-03-23 17:03:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-15', '2023-03-15 07:59:43', '2023-03-15 17:07:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-24', '2023-03-24 07:51:21', '2023-03-24 07:51:21', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-10', '2023-03-10 09:48:16', '2023-03-10 18:09:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-10', '2023-03-10 07:59:22', '2023-03-10 17:12:43', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-07', '2023-03-07 07:57:43', '2023-03-07 17:18:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-24', '2023-03-24 08:14:52', '2023-03-24 08:14:52', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-15', '2023-03-15 07:39:19', '2023-03-15 17:06:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-13', '2023-03-13 07:33:24', '2023-03-13 17:15:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47911887175708', '2023-03-03', '2023-03-03 07:42:42', '2023-03-03 10:03:31', 2.3);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-01', '2023-03-01 07:57:03', '2023-03-01 17:22:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-20', '2023-03-20 08:19:51', '2023-03-20 11:25:27', 3.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-02', '2023-03-02 07:32:26', '2023-03-02 17:10:45', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-29', '2023-03-29 08:00:20', '2023-03-29 17:11:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-15', '2023-03-15 13:06:09', '2023-03-15 17:06:16', 4.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-10', '2023-03-10 07:55:56', '2023-03-10 07:55:56', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-15', '2023-03-15 07:47:52', '2023-03-15 17:19:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-08', '2023-03-08 07:45:26', '2023-03-08 17:17:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-08', '2023-03-08 17:02:18', '2023-03-08 17:02:18', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-22', '2023-03-22 14:42:28', '2023-03-22 17:09:26', 2.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-20', '2023-03-20 08:01:00', '2023-03-20 17:08:15', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-09', '2023-03-09 08:10:14', '2023-03-09 08:10:14', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-10', '2023-03-10 07:50:28', '2023-03-10 17:08:36', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-06', '2023-03-06 07:58:51', '2023-03-06 17:17:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-28', '2023-03-28 07:31:26', '2023-03-28 17:07:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-31', '2023-03-31 07:59:53', '2023-03-31 17:07:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-20', '2023-03-20 08:09:24', '2023-03-20 17:21:28', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-13', '2023-03-13 12:31:31', '2023-03-13 12:31:31', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-17', '2023-03-17 07:51:00', '2023-03-17 17:02:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-21', '2023-03-21 07:12:12', '2023-03-21 07:12:12', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-22', '2023-03-22 07:48:26', '2023-03-22 17:05:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-31', '2023-03-31 07:57:26', '2023-03-31 07:57:26', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-21', '2023-03-21 15:20:56', '2023-03-21 17:50:06', 2.5);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-22', '2023-03-22 07:42:00', '2023-03-22 16:39:57', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-02', '2023-03-02 17:11:06', '2023-03-02 17:11:06', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47911887175708', '2023-03-06', '2023-03-06 07:55:06', '2023-03-06 07:55:06', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-01', '2023-03-01 09:10:19', '2023-03-01 17:22:44', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-02', '2023-03-02 08:03:43', '2023-03-02 08:03:43', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-24', '2023-03-24 08:01:38', '2023-03-24 17:02:41', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-16', '2023-03-16 08:16:59', '2023-03-16 17:30:45', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-06', '2023-03-06 07:50:31', '2023-03-06 17:16:02', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-23', '2023-03-23 07:59:53', '2023-03-23 07:59:53', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-08', '2023-03-08 07:59:36', '2023-03-08 07:59:36', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-10', '2023-03-10 07:53:56', '2023-03-10 17:03:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-17', '2023-03-17 08:10:19', '2023-03-17 08:10:19', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-06', '2023-03-06 07:40:31', '2023-03-06 17:15:55', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-14', '2023-03-14 16:13:03', '2023-03-14 16:13:03', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-24', '2023-03-24 07:39:59', '2023-03-24 17:01:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-17', '2023-03-17 07:53:10', '2023-03-17 17:10:34', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-28', '2023-03-28 08:30:31', '2023-03-28 17:15:26', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-03', '2023-03-03 08:02:17', '2023-03-03 14:25:46', 6.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-30', '2023-03-30 08:01:18', '2023-03-30 17:12:19', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-14', '2023-03-14 07:54:07', '2023-03-14 17:03:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-10', '2023-03-10 12:44:16', '2023-03-10 12:44:16', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-22', '2023-03-22 08:09:09', '2023-03-22 17:46:51', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-10', '2023-03-10 07:27:14', '2023-03-10 17:08:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-21', '2023-03-21 07:40:24', '2023-03-21 17:03:30', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-15', '2023-03-15 08:02:02', '2023-03-15 17:27:55', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-07', '2023-03-07 08:23:04', '2023-03-07 17:37:04', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-22', '2023-03-22 07:55:27', '2023-03-22 17:18:50', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-23', '2023-03-23 07:56:22', '2023-03-23 17:42:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-24', '2023-03-24 08:01:36', '2023-03-24 17:07:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-20', '2023-03-20 07:53:50', '2023-03-20 17:57:19', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-01', '2023-03-01 07:56:53', '2023-03-01 16:10:06', 8.0);


--
-- TOC entry 3391 (class 0 OID 16422)
-- Dependencies: 221
-- Data for Name: timesheets_raw_data_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3392 (class 0 OID 16425)
-- Dependencies: 222
-- Data for Name: timesheets_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.timesheets_tb VALUES ('HaoH', 'Hoàng Hảo', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 1.9, 7.0, 5.4, NULL, 3.0, 14.3);
INSERT INTO public.timesheets_tb VALUES ('ThaoLS', 'Lê Sỹ Thao', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.9, NULL, 0.0, 0.0, 0.0, 0.0, 0.5, NULL, 6.9, 4.6, NULL, 4.0, 14.9);
INSERT INTO public.timesheets_tb VALUES ('SangLT', 'Lê Thị Sang', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 8.0, 6.6, 6.8, NULL, 3.0, 21.4);
INSERT INTO public.timesheets_tb VALUES ('DungLV', 'Lê Văn Dũng', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8.0, 6.8, 0.0, NULL, 2.0, 14.8);
INSERT INTO public.timesheets_tb VALUES ('TrungNT', 'Ngô Thành Trung', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, 7.3, NULL, 0.0, 6.3, 1.2, 0.0, NULL, 3.0, 14.8);
INSERT INTO public.timesheets_tb VALUES ('LuanND', 'Nguyễn Đình Luân', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.2, NULL, NULL, 1.0, 3.2);
INSERT INTO public.timesheets_tb VALUES ('HaiNV', 'Nguyễn Văn Hải', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 7.1, 5.2, 0.0, NULL, 2.0, 12.3);
INSERT INTO public.timesheets_tb VALUES ('HiepPD', 'Phan Đình Hiệp', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 8.0, 5.1, 3.4, NULL, 3.0, 16.5);
INSERT INTO public.timesheets_tb VALUES ('HungTH', 'Trần Hữu Hùng', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.1, NULL, NULL, 0.0, 7.6, 3.6, NULL, 3.0, 11.3);
INSERT INTO public.timesheets_tb VALUES ('VyTTH', 'Trần Thị Hiền Vy', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, 0.0, NULL, 5.2, NULL, 1.9, 5.6, 4.4, NULL, 4.0, 17.1);
INSERT INTO public.timesheets_tb VALUES ('HoanTV', 'Trần Văn Hoàn', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5.3, 0.0, NULL, 3.0, 2.0, 8.3);
INSERT INTO public.timesheets_tb VALUES ('DatTC', 'Thân Công Đạt', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 0.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, 18.0, 144.0);
INSERT INTO public.timesheets_tb VALUES ('QuangNM', 'Nguyễn Minh Quang', 2023, 3, 8.0, 0.0, 7.2, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 0.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, 19.0, 151.2);
INSERT INTO public.timesheets_tb VALUES ('TuanLQ', 'Lê Quốc Tuấn', 2023, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.0, 56.0);
INSERT INTO public.timesheets_tb VALUES ('HiepPD', 'Phan Đình Hiệp', 2023, 3, 0.0, 0.0, 0.0, NULL, NULL, 8.0, 8.0, NULL, 8.0, 0.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 3.1, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 0.0, 14.0, 107.1);
INSERT INTO public.timesheets_tb VALUES ('HaiNV', 'Nguyễn Văn Hải', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, 0.0, 8.0, 0.0, 0.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, 17.0, 136.0);
INSERT INTO public.timesheets_tb VALUES ('ThaoLS', 'Lê Sỹ Thao', 2023, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.1, 0.0, 0.0, NULL, NULL, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8.0, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, 2.0, 8.1);
INSERT INTO public.timesheets_tb VALUES ('ThienLTH', 'Lê Trương Huỳnh Thiên', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, NULL, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 5.4, 8.0, 8.0, 20.0, 157.4);
INSERT INTO public.timesheets_tb VALUES ('LuanND', 'Nguyễn Đình Luân', 2023, 3, 0.0, 0.0, NULL, NULL, NULL, NULL, 0.0, 0.0, 8.0, 0.0, NULL, NULL, 0.0, NULL, NULL, 8.0, NULL, NULL, NULL, 8.0, 2.5, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 0.0, 8.0, 8.0, 8.0, 10.0, 74.5);
INSERT INTO public.timesheets_tb VALUES ('ThanhDD', 'Đường Đức Thanh', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, 23.0, 184.0);
INSERT INTO public.timesheets_tb VALUES ('DungLV', 'Lê Văn Dũng', 2023, 3, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 4.2, NULL, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16.0, 124.2);
INSERT INTO public.timesheets_tb VALUES ('DatNT', 'Nguyễn Thành Đạt', 2023, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1.1, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 0.0, 0.0, NULL, NULL, 8.0, NULL, NULL, NULL, NULL, 11.0, 81.1);
INSERT INTO public.timesheets_tb VALUES ('VyTTH', 'Trần Thị Hiền Vy', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, NULL, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 6.9, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, 21.0, 166.9);
INSERT INTO public.timesheets_tb VALUES ('HaoH', 'Hoàng Hảo', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 0.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17.0, 136.0);
INSERT INTO public.timesheets_tb VALUES ('SangLT', 'Lê Thị Sang', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 8.0, 20.0, 160.0);
INSERT INTO public.timesheets_tb VALUES ('ChuongLV', 'Lê Văn Chương', 2023, 3, NULL, 0.0, 0.0, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, NULL, 8.0, 8.0, NULL, NULL, 0.0, 0.0, 8.0, 8.0, NULL, 14.0, 112.0);
INSERT INTO public.timesheets_tb VALUES ('HungTH', 'Trần Hữu Hùng', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, NULL, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 0.0, 8.0, NULL, NULL, 8.0, NULL, NULL, 8.0, 8.0, 18.0, 144.0);
INSERT INTO public.timesheets_tb VALUES ('TrungNT', 'Ngô Thành Trung', 2023, 3, NULL, 1.6, 0.0, NULL, NULL, NULL, 0.0, 0.0, 8.0, NULL, NULL, NULL, 8.0, 0.0, 0.0, 8.0, NULL, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 8.0, 0.0, 8.0, 5.9, NULL, 11.0, 79.5);
INSERT INTO public.timesheets_tb VALUES ('HoanTV', 'Trần Văn Hoàn', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 6.7, NULL, NULL, NULL, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, 21.0, 166.7);


--
-- TOC entry 3393 (class 0 OID 16428)
-- Dependencies: 223
-- Data for Name: user_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_tb VALUES ('ThaoLS', '1962026656160185351301320480154111117132155', 'Lê Sỹ Thao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('ThienLTH', '1962026656160185351301320480154111117132155', 'Lê Trương Huỳnh Thiên', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('ChuongLV', '1962026656160185351301320480154111117132155', 'Lê Văn Chương', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('VyTTH', '1962026656160185351301320480154111117132155', 'Trần Thị Hiền Vy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('DatTC', '1962026656160185351301320480154111117132155', 'Thân Công Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('SangLT', '1962026656160185351301320480154111117132155', 'Lê Thị Sang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('TrungNT', '1962026656160185351301320480154111117132155', 'Ngô Thành Trung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HungTH', '1962026656160185351301320480154111117132155', 'Trần Hữu Hùng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HoanTV', '1962026656160185351301320480154111117132155', 'Trần Văn Hoàn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HaiNV', '1962026656160185351301320480154111117132155', 'Nguyễn Văn Hải', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('DungLV', '1962026656160185351301320480154111117132155', 'Lê Văn Dũng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('DatNT', '1962026656160185351301320480154111117132155', 'Nguyễn Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HiepPD', '1962026656160185351301320480154111117132155', 'Phan Đình Hiệp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HaiN', '1962026656160185351301320480154111117132155', 'Nguyễn Hải', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HaoH', '1962026656160185351301320480154111117132155', 'Hoàng Hảo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HoangL', '1962026656160185351301320480154111117132155', 'Lê Hoàng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('TuanLQ', '1962026656160185351301320480154111117132155', 'Lê Quốc Tuấn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('QuangNM', '1962026656160185351301320480154111117132155', 'Nguyễn Minh Quang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('ThanhDT', '1962026656160185351301320480154111117132155', 'Đỗ Tấn Thành', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('LuanND', '1962026656160185351301320480154111117132155', 'Nguyễn Đình Luân', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('vitrannhat1', '1', 'Trần Nhật Vĩ', '2001-08-10', 'vitrannhat1@gmail.com', '0919562182', 'An Khe, Thanh Khe', 'Kinh', 'Lương', '233316603', 'None', 'None', '2023-04-16', 'None', 'Admin', NULL, true, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('ThanhDD', 'c30f02adc000b565f761a2b292b37169', 'Đường Đức Thanh', '1997-05-01', 'thanhdd@golineglobal.vn', '0379113210', 'Ngũ Hành Sơn, Đà Nẵng', 'Kinh', 'Không', '1842720757', '550000', 'None', '2023-11-18', 'None', 'Admin', '\xffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc000110800cf00a803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f7aa28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a82eef2dac2d9ae2ee78e0853ef3c8c140fc4d004f457037ff00183c2b6575e4896e6e141c19228be51f9907f4aec348d674fd7b4e8eff004db94b8b693a32f63dc11d8fb5005ea28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28ae77c6de22ff846bc353de4657ed2ff00bb803740c7b9f60013f850051f1a7c40d3fc27134236dc6a2572b003c27a173dbe9d4feb5e35ff00158fc4ed499e1124b0a360cae76410fb0ed9f61935b3e05f00cde34b96d7f5e794e9ad2168d19887ba6cf2c4f65cfe75ee16f6b6f656d1db5ac31c3046bb5238d42aa8f602803c92cbe065a0b7cea7acdcbce474b6454553ff0002049fd2b94b5bff00107c27f155f585abadd5ab859191d4ed950fdd7c67861d0e0fe7c57d0af5e3df19ad4c573a3ea71f04892da43ea382a3ff0042a60769e0ef89565e25b85b1b987ec77cc3e45dd9493d81ec7dabbaaf91ad2f89bf11dabfef2201fcc56da55b3fc3ee315f43f80bc6b0f896c16d6e5c2ea9027ef01e3cd03f8c7f51d8d203b2a28a2800a28a2800a28a2800a28a28022b897c98b70196270a3d49a6412b995a1947cea01dc3a1f6ff003eb45d18e3d93cd2048e2cb1cf4ac8bad4a68e417a2ca44b50402ec4063e876d006fd155e1bd866b05bcde12129bcb39dbb477cfa62bcafc63f18e1b33259f87c2c8e38376e32bff00011dfea7f23401ea9797d69a7c266bcb986de21fc72b851fad55d375fd2758774d3b5082e5d396547e40f5c7a57cf763e17f1c78fe6fb732cbe4bf4babd90a211fecf723e83156353f01f8abe1b341e24b3bab7b816cc1a536e5be519c619481953d09f7a00fa3abc97e2ab3eb5e22d17c350390d3baab11fc3bdb93f82a93f8d684ff001a340fec282f2cd64b8bd99326d7eef94ddc331f7f4ce6b8ff0004eaf378abe2d5b5fdc90ef124b33151f28250a803d80e07d2803dc2d2d60b1b386ceda311c1022c71a0e8aa0600a98800507ef5231aa48cd36dd8ad27de35e6df19210fe0eb793bc57a8d9faab8feb5e8f2fde35e7df17c67e1f5c9eeb34447fdf4052ea687cfd66ed0dddcc8bd54023fefb1fe35d769ba8cd6d7116a7a7c862b981b790bd41f5c771ea2bb8d0fe08d9dff0085ecef65d4aea0d42ea049240555917386c63839e9dfd6bce753d3b51f0a6b7258dec662b984f51f7645ecca7b83401f48783fc596de2ad2c4c9b63bb880171067ee9f51fec9ed5d157cc7a46b975a1ddc7ad6927e68f8961ec41eaa7fd93fa1c57d0be1bf115978a3458752b16f95c61e327e68dbba9a406bd14514005554bb0d7f25a9eaa011f90ff3f855aac5bc95ac3c436f331fdc5da7967d9d7247e609fca8036599514b3b0551d493555352b5926112c992c700e0e09fad561b2fe76958ef851b6a21e84f727d69fa98ff0043daa993b9400074f9873f851615f5b0379779a930621e3b60005edbcf7fc063f3a4d5e31269772a7a04ddf973fd2a3d3ec4e9f75791eeca4ae254e3d4723f3fe629dac5e4565a54f3cc4045524e7b81c9fd3340753c73e227896f9fecbe13d3f7b15c2cd1c5c9965639d9ee1738f73f4ae8fc0df0a2cf4b58f52d7e34bcd44e19606f9a384ffeccdee781dbd6b2fe15e99fdb3e26d5bc4f763cc686530c0587f19e5dbeb823fefa35ec0a79a60dd95d9320c0000e954f55b38afecae2ce7198ae21689c7b3020ff003aba950ce7e627d051604ee7ca7e1df02eb1e22d427b4d3e28c4904a6399a46daa80120927af518c006bd23c37e159fe1dfc4ad2ed1ee96ee1d4ad9c19426cc38e0a81939c12a73ef5bff0ea18ecbc4de2a0570cdaacea08f4dca47fe846ba7f185bc4b6f6daa792af75665fc963fc1b97271eff00281fa77a433a03d698e71d6ab69b7dfda3a65bde6cd9e6a6e2be9ffd6a95cd34ec4a8eb72291b26b85f8a5035e783fec687e7b8ba8635faeecff004aeddbad735e228c5eeb7e1ad3f20b36a02e8afaac4a49fd585051dbc71ac51246830a802a8f402b98f1c782acfc65a579526d8afa104db5c63953e87d54f7fceba9a2901f244d06a1e1ad626b1be84c53c476c91b7461fd411debacf087899fc35aaadf5a3992c24c2dcc19e42fd3d4763f877af59f1ff812dbc61a6ef8b643aa40bfb8988fbc3fb8dec7f43f8e7e7486d751d375b7b396d655b985ca4b01539f718ef9a607d7304f15cdbc73c2e1e29503a38e8c08c834571bf0b351379e11fb333966b19da0527a94e197f46c7e145481db551d56c56fec4c6572c8eb2a7d54e71f8f23f1abd453031f493fe8eea410565604118357653bb03d580c7e34b342eb3196240db8619738e9d0ff009f6a58607f304b311b87dd55e8bfe26801f7113c9b5a2754917a165c820f51dbdabca3e2bf880d9bdbe88921791c09ae987002e7e5403b72327e8b5ebb5e01f13a212f8aef6e41248710b8f421011f98fe5401dd7c20b710f806197209b8b99a427fe0657f928aef475af2ef825a94973e1dd434f9381677598c63a2b8ce3f30c7f1af511d69f5265f0b265e9504c0956c1e6a50702a31f31e7a536c23b1e5fa57990f8cb57844cbe5cbab02d181f364794c1b3e9c631ef5e95abda1bed3268571bf865cf4c839fe95cff86ad127bad7df6065feda6383fec2273f8115d7549464e8db3fb12cfca5db17943cb19cfc9fc3cfd31561eb0ecef21d07557d06ee45863959a6d39dce1644272d183fde4248c7f74afbd5dd575ad3746b733ea37b0db463a6f7e5be83a93f4a00b2c6b95f0e4c3c47e3bbdd5a13bf4fd2e23670483a3cadcc841f4edf80acb7d435bf883235968914da6e884ed9f50946d9255eea83b7f3fa57a168ba359681a541a6d84423b784607ab1ee4fa93401a1451450015524d2f4f9af92fa5b2b77bb41859da305c7e3d6add1401e79e018d74df1878a74a51b6359124897d14171fcb6d14ed2cf91f1a7578870b2d8eec7bfee8ff5345007a0d145140051451400578478fda34f881a8d9ce9b12e1236127d5142b7d432b73e9c57bbd7967c61f0d1b9b5b7f115b2132daaf933e073e593907f027f5f6a00c8f847771586b7a9e9b38f2ee6e55703b168f7647d70c4fd057b0d7cd70df4d0bda6b16adb6e6d9d4487dc7dd6ff00d94fe15f42e8baac3ade916da85bfdc993257fbaddc7e0722803409f969631cd36b23c55ab1d17c39733c4737728f22d5475695f85c7e273f850033c15893459ef07ddbcbeb9b853eaad2b60fe40574754746d3d74ad16cb4f4e96f0ac7f881cd5ea00cfd6743d37c41a7b58ea968971013b806eaa7b107a83ee2b9db0f85de15b1b913fd89e7607813bee03f0e33f8e6bb2a2801b1c69146b1c68a88a30aaa3000f614ea28a0028a28a0028a28a00f3a56f2fe389ff00a6b6857ff1c53ffb2d14dbc3b7e37e9ffed40c3ff2137f851401e8f4514500145145001515cdbc5796b2db4e81e1950a3a1e8548c1152d1401f356b3a4bf84fc5175a55c867b56c8527fe5a44dd0fd7fa8aea7e1878824d2bc4371e1bbd726dee3125b49db7e3ff66183f518aebbe2a785ff00b6bc3ffda36d1e6f6c017e072f1ff10fc3afe07d6bc66dee5e68a092072b7f6a731e0e0ba839c0f707914c0fa4355d5b4fd0ec5af352b98ede15eec7963e807527d8572ba1477be34d7e1f11dfc0f6fa4599274db6907cd239e3cd61fcbffadce5782741d3fc5ebff090eb3a8cbaadda39536d370b011d8aff00f580f6af52555450aa005030001c0a402d145140051451400514514005145140051451401e6ba91c7c6ed27fdc61ff009064a2a2d5a551f1c3498f3fbcda1b1fec98a419fce8a00f4fa28a2800a28a2800a28a28002010411907ad7cd3f127c38de14f1238b752b65724cb6c474033cafe07f4c57d2d593aef86f4af11c76a9aa5b0996da61347ce391d8fb1ee2803e78f0778b6f7c3be214ba0afb9c05b9808c79e9f43fc43a83debe95b1bdb7d46c61bcb5904904c81d187706b94f1f7816dbc53a46fb68921d5ad5736b3280b9c7f01ff0064fe87f1ae57e15f8a1e29bfb1af731acceca8afc18a71f790fa6ec123dc37ad303d768a28a401451450014514500145145001451450060de7856cef3c63a7f8959dd6eace1787601c3839c67e9b9bf3a2b7a8a0028a28a0028a28a0028a28a0028a28a002bc43e23e8ede1ef1947aadbb186cf5520b48bff2c6e54821bf3c37bfcd5edf5ce78e7c3a3c4fe13bcd3d541b90be6db1f495791f9f23e84d0059f0aeba3c43a0417a405b8198ae631fc12af0c3e9dc7b115b55e17f0afc506c75a8ed2e58ac37f8b794371b2751f21ff810cafd40af74a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00f9f7e236867c3be389268b31596adfbe8dd78f2e60727f26c37fc0abd93c1baf8f11f86adaf5f02e57315ca7f7655e1bf3ebf422b3fe247868f89bc21711429baf6dbfd22db1d4b28e57f1191f5c5719f03b5092ea4d6a220ec0b0b37a6ff009867ea401f95007b0d1451400514514005145140051451400514514005145140051451400514514005145140051451400565e91e1dd2b4296f64d36d1606bd97ce9f6927737b67a0e4f038e4d6a514005145140051451400514514005145140051451480ffd9', false, 'DEV', 'PHP', 'PM');


--
-- TOC entry 3221 (class 2606 OID 16434)
-- Name: screen_auth_tb auth_screen_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screen_auth_tb
    ADD CONSTRAINT auth_screen_tb_pkey PRIMARY KEY (screen_id, auth_group_id);


--
-- TOC entry 3215 (class 2606 OID 16436)
-- Name: auth_group_tb authentication_group_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_tb
    ADD CONSTRAINT authentication_group_tb_pkey PRIMARY KEY (auth_group_id);


--
-- TOC entry 3217 (class 2606 OID 16438)
-- Name: department_tb department_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_tb
    ADD CONSTRAINT department_tb_pkey PRIMARY KEY (department_id);


--
-- TOC entry 3219 (class 2606 OID 49232)
-- Name: member_of_team_tb member_of_team_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_of_team_tb
    ADD CONSTRAINT member_of_team_tb_pkey PRIMARY KEY (member_id);


--
-- TOC entry 3233 (class 2606 OID 41047)
-- Name: position_tb position_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_tb
    ADD CONSTRAINT position_tb_pkey PRIMARY KEY (position_id);


--
-- TOC entry 3223 (class 2606 OID 16442)
-- Name: screen_tb screen_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screen_tb
    ADD CONSTRAINT screen_tb_pkey PRIMARY KEY (screen_id);


--
-- TOC entry 3225 (class 2606 OID 16444)
-- Name: team_tb team_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_tb
    ADD CONSTRAINT team_id_pkey PRIMARY KEY (team_id);


--
-- TOC entry 3227 (class 2606 OID 16446)
-- Name: timesheets_details_tb timesheets_details_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timesheets_details_tb
    ADD CONSTRAINT timesheets_details_tb_pkey PRIMARY KEY (fullname, date);


--
-- TOC entry 3229 (class 2606 OID 16448)
-- Name: timesheets_tb timesheets_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timesheets_tb
    ADD CONSTRAINT timesheets_tb_pkey PRIMARY KEY (username, year, month);


--
-- TOC entry 3231 (class 2606 OID 16450)
-- Name: user_tb user_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tb
    ADD CONSTRAINT user_tb_pkey PRIMARY KEY (username);


--
-- TOC entry 3240 (class 2620 OID 16451)
-- Name: timesheets_details_tb update_time_when_duplicate_fullname_and_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_time_when_duplicate_fullname_and_date BEFORE INSERT ON public.timesheets_details_tb FOR EACH ROW EXECUTE FUNCTION public.update_time_when_duplicate_fullname_and_date();


--
-- TOC entry 3241 (class 2620 OID 16452)
-- Name: timesheets_tb update_total_working_hours_and_days_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_total_working_hours_and_days_trigger BEFORE INSERT OR UPDATE ON public.timesheets_tb FOR EACH ROW EXECUTE FUNCTION public.update_total_working_hours_and_days();


--
-- TOC entry 3234 (class 2606 OID 49226)
-- Name: member_of_team_tb member_of_team_tb_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_of_team_tb
    ADD CONSTRAINT member_of_team_tb_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.team_tb(team_id);


--
-- TOC entry 3235 (class 2606 OID 49221)
-- Name: team_tb team_tb_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_tb
    ADD CONSTRAINT team_tb_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department_tb(department_id);


--
-- TOC entry 3236 (class 2606 OID 32876)
-- Name: timesheets_tb timesheets_tb_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timesheets_tb
    ADD CONSTRAINT timesheets_tb_username_fkey FOREIGN KEY (username) REFERENCES public.user_tb(username);


--
-- TOC entry 3237 (class 2606 OID 32856)
-- Name: user_tb user_tb_auth_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tb
    ADD CONSTRAINT user_tb_auth_group_id_fkey FOREIGN KEY (auth_group_id) REFERENCES public.auth_group_tb(auth_group_id);


--
-- TOC entry 3238 (class 2606 OID 49238)
-- Name: user_tb user_tb_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tb
    ADD CONSTRAINT user_tb_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.position_tb(position_id);


--
-- TOC entry 3239 (class 2606 OID 49233)
-- Name: user_tb user_tb_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tb
    ADD CONSTRAINT user_tb_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.team_tb(team_id);


-- Completed on 2023-04-21 14:00:16

--
-- PostgreSQL database dump complete
--

