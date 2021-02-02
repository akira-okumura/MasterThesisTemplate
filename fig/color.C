void color(bool sim = false, bool dash=false) {
  auto red = TColor::GetFreeColorIndex();
  new TColor(red, 0x92/255., 0x63/255., 0x00/255.);
  auto green = TColor::GetFreeColorIndex();
  new TColor(green, 0x98/255., 0x6b/255., 0x2f/255.);

  auto pi = TMath::Pi();
  auto f1 = new TF1("f1", "sin(x)", -pi, pi);
  auto f2 = new TF1("f2", "cos(x)", -pi, pi);
  if (sim) {
    f1->SetLineColor(red);
    f2->SetLineColor(green);
  } else {
    f1->SetLineColor(kRed);
    f2->SetLineColor(kGreen - 2);
  }

  if (dash) {
    f2->SetLineStyle(7);
  }

  f1->SetLineWidth(5);
  f2->SetLineWidth(5);
  f1->SetTitle("");
  f1->Draw("l");
  f2->Draw("l same");

  auto ax = f1->GetXaxis();
  ax->SetNdivisions(202);
  ax->ChangeLabel(1, -1, -1, -1, -1, -1, "-#pi");
  ax->ChangeLabel(-1, -1, -1, -1, -1, -1, "#pi");

  auto leg = new TLegend(0.15, 0.7, 0.35, 0.85);
  leg->AddEntry(f1, "sin(#it{x})", "l");
  leg->AddEntry(f2, "cos(#it{x})", "l");
  leg->SetMargin(0.5);
  leg->Draw();
}
