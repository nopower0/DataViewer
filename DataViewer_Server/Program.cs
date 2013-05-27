﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Net.Sockets;
using System.Net;
using System.Xml;
using DataViewer_Entity;

namespace DataViewer_Server
{
	class Program
	{
		static void Main(string[] args)
		{
			XmlDocument doc = new XmlDocument();
			doc.Load("Host.xml");
			string ip = doc.GetElementsByTagName("host")[0].InnerText;
			int port = Int32.Parse(doc.GetElementsByTagName("port")[0].InnerText);
			IPEndPoint ipEndPoint = new IPEndPoint(IPAddress.Parse(ip), port);
			TcpListener listener = new TcpListener(ipEndPoint);
			listener.Start();
			while (true)
			{
				Console.WriteLine("Waiting Connection...");
				Task task = new Task(ClientTask, listener.AcceptTcpClient());
				task.Start();
			}
		}

		static void ClientTask(object client)
		{
			bool connected = true;
			NetworkStream stream = (client as TcpClient).GetStream();
			StringBuilder dataStringBuilder = new StringBuilder();
			while (connected)
			{
				List<byte> data_all = new List<byte>();
				// Read all data from buffer
				while (stream.DataAvailable)
				{
					byte[] data = new byte[1024];
					stream.Read(data, 0, data.Length);
					foreach (byte item in data)
					{
						if (item != 0)
							data_all.Add(item);
						else
							break;
					}
				}
				if (data_all.Count != 0)
				{
					dataStringBuilder.Append(new string(Encoding.UTF8.GetChars(data_all.ToArray())));
					string data = dataStringBuilder.ToString();
					if (data.Last<char>() == ';')
					{
						data = data.TrimEnd(';');
						string pairs = data.Split('\n')[0];
						pairs = pairs.Trim(' ');
						if (pairs != "")
							ProcessData(pairs);
						if (data.Split('\n')[1] == "disconnect")
							connected = false;
					}
				}
			}
			(client as TcpClient).Close();
			Console.WriteLine("Connection Closed");
		}

		static void ProcessData(string data)
		{
			string[] keyValuePairs = data.Split(' ');
			DateTime loggingOn = DateTime.Now;
			foreach (string pair in keyValuePairs)
			{
				int nodeID = Int32.Parse(new string(pair.Split(':')[0].Reverse<char>().ToArray<char>()));
				double concentration = ConvertToConcentration(Int32.Parse(new string(pair.Split(':')[1].Reverse<char>().ToArray<char>())));
				//Concentration.SubmitConcentration(nodeID, loggingOn, concentration);
				Console.WriteLine("{0} : {1:0.00}", nodeID, concentration);
			}
		}

		static double ConvertToConcentration(int data)
		{
			double ratio = ((double)data) / 30000 * 100;
			if (ratio < 2.2)
				return (2.2 - 0.5) / 0.2 * (ratio - 0) + 0.5;
			else if (ratio < 4.2)
				return (4.2 - 2.2) / 0.2 * (ratio - 0.2) + 2.2;
			else if (ratio < 6.1)
				return (6.1 - 4.2) / 0.2 * (ratio - 0.2) + 4.2;
			else if (ratio < 7.8)
				return (7.8 - 6.1) / 0.2 * (ratio - 0.2) + 6.1;
			else if (ratio < 11.7)
				return (11.7 - 7.8) / 0.2 * (ratio - 0.2) + 7.8;
			else if (ratio < 13.3)
				return (13.3 - 11.7) / 0.2 * (ratio - 0.2) + 11.7;
			else if (ratio < 15)
				return (15 - 13.3) / 0.2 * (ratio - 0.2) + 13.3;
			else
				return -1;
		}
	}
}
