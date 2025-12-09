declare module '@apiverve/colornamefinder' {
  export interface colornamefinderOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface colornamefinderResponse {
    status: string;
    error: string | null;
    data: ColorNameFinderData;
    code?: number;
  }


  interface ColorNameFinderData {
      inputHex:         string;
      inputRGB:         RGB;
      exactMatch:       boolean;
      closestColor:     Closest;
      closestMatches:   Closest[];
      totalNamedColors: number;
  }
  
  interface Closest {
      name:       string;
      hex:        string;
      distance:   number;
      similarity: number;
      rgb:        RGB;
  }
  
  interface RGB {
      r: number;
      g: number;
      b: number;
  }

  export default class colornamefinderWrapper {
    constructor(options: colornamefinderOptions);

    execute(callback: (error: any, data: colornamefinderResponse | null) => void): Promise<colornamefinderResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: colornamefinderResponse | null) => void): Promise<colornamefinderResponse>;
    execute(query?: Record<string, any>): Promise<colornamefinderResponse>;
  }
}
