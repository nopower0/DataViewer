﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using DataViewer_Entity;

namespace DataViewer_ConfigureTool.PopupDialog
{
	/// <summary>
	/// AddAreaDialog.xaml 的交互逻辑
	/// </summary>
	public partial class AddAreaDialog : Window
	{
		private Project project;

		public AddAreaDialog(Project project)
		{
			InitializeComponent();
			this.project = project;
		}

		private void On_ConfirmButton_Click(object sender, RoutedEventArgs e)
		{
			Area area = Area.CreateArea(project);
			area.AreaName = AreaName_TextBox.Text;
			area.Save();
			this.Close();
		}

		private void On_CancelButton_Click(object sender, RoutedEventArgs e)
		{
			this.Close();
		}
	}
}