package com.Voxce.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="server_configurations")
public class ServerConfiguration {
 
private int config_id;

private String host;
private String user;
private String password;
private String port;
private String from;

		@Id
		@GeneratedValue
		@Column(name="config_id")
		public int getConfig_id() {
			return config_id;
		}

		public void setConfig_id(int config_id) {
			this.config_id = config_id;
		}
		@Column(name="host")
		public String getHost() {
			return host;
		}

		public void setHost(String host) {
			this.host = host;
		}
		@Column(name="user_name")
		public String getUser() {
			return user;
		}

		public void setUser(String user) {
			this.user = user;
		}
		@Column(name="password")
		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}
		@Column(name="port")
		public String getPort() {
			return port;
		}

		public void setPort(String port) {
			this.port = port;
		}
		@Column(name="from")
		public String getFrom() {
			return from;
		}

		public void setFrom(String from) {
			this.from = from;
		}
 
}