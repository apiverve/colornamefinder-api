declare module '@apiverve/colornamefinder' {
  export interface colornamefinderOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface colornamefinderResponse {
    status: string;
    error: string | null;
    data: ColorNameFinderData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface ColorNameFinderData {
      inputHex:         null | string;
      inputRGB:         RGB;
      exactMatch:       boolean | null;
      closestColor:     Closest;
      closestMatches:   Closest[];
      totalNamedColors: number | null;
  }
  
  interface Closest {
      name:       null | string;
      hex:        null | string;
      distance:   number | null;
      similarity: number | null;
      rgb:        RGB;
  }
  
  interface RGB {
      r: number | null;
      g: number | null;
      b: number | null;
  }

  export default class colornamefinderWrapper {
    constructor(options: colornamefinderOptions);

    execute(callback: (error: any, data: colornamefinderResponse | null) => void): Promise<colornamefinderResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: colornamefinderResponse | null) => void): Promise<colornamefinderResponse>;
    execute(query?: Record<string, any>): Promise<colornamefinderResponse>;
  }
}
