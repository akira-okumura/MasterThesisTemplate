void color2(bool sim = false, bool marker=false) {
  auto red = TColor::GetFreeColorIndex();
  new TColor(red, 0x92/255., 0x63/255., 0x00/255.);
  auto green = TColor::GetFreeColorIndex();
  new TColor(green, 0x98/255., 0x6b/255., 0x2f/255.);

  auto g1 = new TGraph;
  auto g2 = new TGraph;

  gRandom->SetSeed(1);
  for (int i = 0; i < 100; ++i) {
    double x = gRandom->Gaus(0.2, 1);
    double y = gRandom->Gaus(-0.1, 2);
    g1->SetPoint(i, x, y);
    x = gRandom->Gaus(-0.5, 1.5);
    y = gRandom->Gaus(-0.1, 1);
    g2->SetPoint(i, x, y);
  }

  if (sim) {
    g1->SetMarkerColor(red);
    g2->SetMarkerColor(green);
  } else {
    g1->SetMarkerColor(kRed);
    g2->SetMarkerColor(kGreen - 2);
  }

  g1->SetMarkerStyle(20);
  g2->SetMarkerStyle(20);
  if (marker) {
    g2->SetMarkerStyle(25);
  }

  auto can = new TCanvas("can", "can");
  can->DrawFrame(-4, -6, 4, 6);
  g1->Draw("p same");
  g2->Draw("p same");

  auto leg = new TLegend(0.15, 0.7, 0.35, 0.85);
  leg->AddEntry(g1, "Sample A", "p");
  leg->AddEntry(g2, "Sample B", "p");
  leg->SetMargin(0.5);
  leg->Draw();
}
